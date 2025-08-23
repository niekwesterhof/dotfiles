#!/usr/bin/env python3
import curses
import re
import sys
import subprocess

ALIAS_FILE = "/home/niek/dotfiles/aliases/aliases.sh"

def parse_aliases(file_path):
    result = []

    with open(file_path, "r") as f:
        content = f.read()

    # Match aliases
    alias_pattern = re.compile(r"^\s*alias\s+(\w+)=['\"](.+?)['\"]\s*(?:#\s*(.*))?$", re.MULTILINE)
    for m in alias_pattern.finditer(content):
        result.append({
            "type": "alias",
            "name": m.group(1),
            "command": m.group(2),
            "description": m.group(3) or "",
        })

    # Match functions
    func_pattern = re.compile(r"^\s*(\w+)\s*\(\)\s*\{([\s\S]+?)\}\s*(?:#\s*(.*))?$", re.MULTILINE)
    for m in func_pattern.finditer(content):
        body = m.group(2).strip()
        result.append({
            "type": "function",
            "name": m.group(1),
            "command": body,
            "description": m.group(3) or "",
        })

    return result

def filter_name_only(items, prefix):
    if not prefix:
        return items
    return [item for item in items if item["name"].lower().startswith(prefix.lower())]

def filter_items_search(items, query):
    if not query:
        return items
    query_lower = query.lower()
    return [item for item in items if query_lower in item["name"].lower() or query_lower in item["description"].lower()]

def menu(stdscr, items, initial_filter=""):
    curses.curs_set(0)
    current = 0
    search_query = ""
    search_mode = False

    while True:
        stdscr.erase()
        h, w = stdscr.getmaxyx()
        stdscr.addstr(0, 0, "↑/↓: navigate, Enter: select, q: quit, /: search (name & description)"[:w-1])
        stdscr.addstr(1, 0, f"Filter: {search_query}"[:w-1], curses.A_BOLD)

        # Filter for interactive search
        filtered = filter_items_search(items, search_query)
        if not filtered:
            stdscr.addstr(3, 0, "(no matches)")
        else:
            max_rows = h - 4
            start = max(0, current - max_rows + 1) if current >= max_rows else 0
            stdscr.addstr(2, 0, f"{'Name':<15}{'Description':<40}{'Command'}", curses.A_BOLD | curses.A_UNDERLINE)
            for idx, item in enumerate(filtered[start:start+max_rows]):
                name = f"{item['name']:<15}"
                desc = f"{item['description']:<40}"
                cmd = f"{item['command']}"
                line = f"{name}{desc}{cmd}"
                attr = curses.A_REVERSE if idx + start == current else curses.A_NORMAL
                stdscr.addstr(3 + idx, 0, line[:w-1], attr)

        stdscr.refresh()
        key = stdscr.getch()

        if search_mode:
            if key in (10, 13, curses.KEY_ENTER):
                search_mode = False
            elif key in (27,):
                search_mode = False
                search_query = ""
            elif key in (8, 127, curses.KEY_BACKSPACE):
                search_query = search_query[:-1]
            elif 32 <= key <= 126:
                search_query += chr(key)
            current = 0
        else:
            if key in (curses.KEY_UP, ord('k')):
                current = (current - 1) % max(1, len(filtered))
            elif key in (curses.KEY_DOWN, ord('j')):
                current = (current + 1) % max(1, len(filtered))
            elif key in (10, 13, curses.KEY_ENTER):
                if filtered:
                    return filtered[current]
            elif key in (27, ord('q')):
                return None
            elif key == ord('/'):
                search_mode = True
                search_query = ""
                current = 0

if __name__ == "__main__":
    all_items = parse_aliases(ALIAS_FILE)

    # Initial filter arg only filters by name
    initial_filter = sys.argv[1] if len(sys.argv) > 1 else ""
    filtered_items = filter_name_only(all_items, initial_filter)

    choice = curses.wrapper(menu, filtered_items)

    if choice:
        print(f"Executing: {choice['name']} -> {choice['command']}")
        try:
            subprocess.run(choice["command"], shell=True, check=True)
        except subprocess.CalledProcessError as e:
            print(f"Command failed: {e}")
    else:
        print("Cancelled")

