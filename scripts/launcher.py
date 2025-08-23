import json
import curses
import subprocess
from pathlib import Path
import argparse

# Path to your JSON file
FILE_PATH = "websites.json"


# Command to open webapp (uwsm chromium)
def open_webapp(url: str):
    cmd = f'uwsm app -- chromium --new-window --ozone-platform=wayland --app="{url}"'
    subprocess.run(cmd, shell=True)


def load_json(file_path: str):
    path = Path(file_path)
    if path.exists():
        try:
            with path.open("r", encoding="utf-8") as f:
                data = json.load(f)
                if isinstance(data, list):
                    return data
        except Exception as e:
            print("❌ Failed to load JSON:", e)
    return []


def add_entry(file_path: str, name: str, url: str, description: str = ""):
    data = load_json(file_path)
    for entry in data:
        if entry["name"] == name:
            entry["url"] = url
            entry["description"] = description
            save_json(file_path, data)
            print(f"🔄 Updated {name}")
            return
    data.append({"name": name, "url": url, "description": description})
    save_json(file_path, data)
    print(f"✅ Added {name}")


def save_json(file_path: str, data):
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)


def curses_menu(stdscr, data):
    curses.curs_set(0)
    current_row = 0
    search_query = ""
    filtered = (
        data if data else [{"name": "No entries found", "description": "", "url": ""}]
    )

    # Rose Pine Dark theme
    curses.start_color()
    curses.use_default_colors()
    curses.init_pair(
        1, curses.COLOR_BLACK, curses.COLOR_MAGENTA
    )  # selected row background
    curses.init_pair(2, curses.COLOR_WHITE, -1)  # normal row text
    curses.init_pair(3, 203, -1)  # header/search in rose pink (if supported)

    while True:
        stdscr.clear()
        h, w = stdscr.getmaxyx()

        # Header
        stdscr.attron(curses.color_pair(3))
        stdscr.addstr(
            0, 0, "Filter with '/', select with ENTER, quit with 'q'".ljust(w)
        )
        if search_query:
            stdscr.addstr(1, 0, f"Search: {search_query}".ljust(w))
        stdscr.attroff(curses.color_pair(3))

        if not filtered:
            filtered = [{"name": "No matches found", "description": "", "url": ""}]
            current_row = 0

        # Display entries
        for idx, entry in enumerate(filtered):
            name = entry.get("name", "")
            description = entry.get("description", "")
            url = entry.get("url", "")
            # Truncate description if too long
            description_display = (
                (description[:37] + "…") if len(description) > 40 else description
            )
            row = f"{name:20} | {description_display:40} | {url}"
            y = idx + 2
            if y >= h - 1:
                break
            if idx == current_row:
                stdscr.attron(curses.color_pair(1))
                stdscr.addstr(y, 0, row[: w - 1])
                stdscr.attroff(curses.color_pair(1))
            else:
                stdscr.attron(curses.color_pair(2))
                stdscr.addstr(y, 0, row[: w - 1])
                stdscr.attroff(curses.color_pair(2))

        stdscr.refresh()
        key = stdscr.getch()

        if key == curses.KEY_UP and current_row > 0:
            current_row -= 1
        elif key == curses.KEY_DOWN and current_row < len(filtered) - 1:
            current_row += 1
        elif key == ord("q"):
            break
        elif key == ord("\n") and filtered and filtered[current_row].get("url"):
            open_webapp(filtered[current_row]["url"])
            break
        elif key == ord("/"):
            curses.echo()
            stdscr.addstr(h - 1, 0, "/ ")
            query = stdscr.getstr(h - 1, 2, 60).decode("utf-8").strip()
            curses.noecho()
            search_query = query
            filtered = [
                e
                for e in data
                if query.lower() in e.get("name", "").lower()
                or query.lower() in e.get("description", "").lower()
                or query.lower() in e.get("url", "").lower()
            ]
            current_row = 0


def main():
    parser = argparse.ArgumentParser(description="Manage Python library bookmarks")
    parser.add_argument("command", nargs="?", choices=["add", "list"], default="list")
    args = parser.parse_args()

    if args.command == "add":
        name = input("Enter library name: ").strip()
        url = input("Enter docs URL: ").strip()
        description = input("Enter description: ").strip()
        add_entry(FILE_PATH, name, url, description)
    else:
        data = load_json(FILE_PATH)
        if not data:
            print("📂 No entries found. Add one with: python script.py add")
        curses.wrapper(lambda stdscr: curses_menu(stdscr, data))


if __name__ == "__main__":
    main()
