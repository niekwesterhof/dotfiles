#!/usr/bin/env python3
import curses
import os
import subprocess
from datetime import datetime

VAULT_ROOT = '/home/niek/Documents/Vault'
VAULT_DIRS = [
    "00 - Maps of Content",
    "01 - Projects",
    "02 - Areas",
    "03 - Resources",
    "04 - Permanent",
    "05 - Fleeting",
    "06 - Daily",
    "07 - Archives"
]

def text_input(stdscr, prompt):
    """Get string input from user in curses."""
    curses.echo()
    stdscr.clear()
    stdscr.addstr(0, 0, prompt)
    stdscr.refresh()
    s = stdscr.getstr(1, 0).decode()
    curses.noecho()
    return s.strip()

def menu(stdscr, options, prompt="Select an option"):
    curses.curs_set(0)
    current = 0
    search_query = ""
    search_mode = False

    while True:
        stdscr.erase()
        h, w = stdscr.getmaxyx()
        stdscr.addstr(0, 0, f"{prompt} (↑/↓ navigate, Enter select, / search, q quit)"[:w-1], curses.A_BOLD)
        stdscr.addstr(1, 0, f"Filter: {search_query}"[:w-1], curses.A_BOLD)
        
        # Filter options by search query
        filtered = [opt for opt in options if search_query.lower() in opt.lower()]
        if not filtered:
            stdscr.addstr(3, 0, "(no matches)")
        else:
            max_rows = h - 4
            start = max(0, current - max_rows + 1) if current >= max_rows else 0
            for idx, opt in enumerate(filtered[start:start+max_rows]):
                attr = curses.A_REVERSE if idx + start == current else curses.A_NORMAL
                stdscr.addstr(3 + idx, 0, opt[:w-1], attr)

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
            elif key in (ord('q'), 27):
                return None
            elif key == ord('/'):
                search_mode = True
                search_query = ""
                current = 0

def get_subfolders(path):
    try:
        return [f for f in os.listdir(path) if os.path.isdir(os.path.join(path, f))]
    except FileNotFoundError:
        return []

def create_note(note_name, path_vault, path_array):
    ob_tags = "tags: ["
    ob_class = ""
    if len(path_array) > 5:
        for i, folder in enumerate(path_array[5:], start=5):
            name = folder.replace(" ", "-" if i == 5 else "_")
            ob_tags += f" {name}"
            if i == 5:
                ob_class = name
    ob_tags += " ]"

    ob_date = datetime.now().strftime("%y-%m-%d")
    ob_time = datetime.now().strftime("%H:%M:%S")
    template = f"""---
id: {note_name}
Date: {ob_date} {ob_time}
{ob_tags}
cssclasses: [ {ob_class} ]
---

***

# """

    note_path = os.path.join(path_vault, f"{note_name}.md")
    if os.path.exists(note_path):
        return f"File {note_name}.md already exists!"

    with open(note_path, "w") as f:
        f.write(template)

    subprocess.run(["nvim", note_path])
    return f"Note {note_name}.md created."

def curses_main(stdscr):
    # Step 1: Note name
    note_name = text_input(stdscr, "Enter note filename:")
    if not note_name:
        return

    # Step 2: Main folder
    main_folder = menu(stdscr, VAULT_DIRS, "Choose a main Vault folder")
    if main_folder is None:
        return
    path_vault = os.path.join(VAULT_ROOT, main_folder)
    path_array = path_vault.split("/")

    # Step 3: Subfolder selection
    while True:
        subfolders = get_subfolders(path_vault)
        subfolders.append("New folder")
        choice = menu(stdscr, subfolders, f"Select subfolder inside {path_vault}")
        if choice is None:
            break  # quit subfolder selection
        elif choice == "New folder":
            new_folder = text_input(stdscr, "Enter new folder name:")
            if not new_folder:
                break
            path_vault = os.path.join(path_vault, new_folder)
            os.makedirs(path_vault, exist_ok=True)
            path_array.append(new_folder)
        else:
            path_vault = os.path.join(path_vault, choice)
            path_array.append(choice)

        # Stop automatically after selecting one subfolder level
        # If you want deeper nesting, the user can select "New folder" again
        if choice != "New folder":
            break

    # Step 4: Create note and open nvim
    note_path = os.path.join(path_vault, f"{note_name}.md")
    if not os.path.exists(note_path):
        create_note(note_name, path_vault, path_array)

    # Open note in nvim; wrapper exits after nvim closes
    subprocess.run(["nvim", note_path])


def main():
    curses.wrapper(curses_main)

if __name__ == "__main__":
    main()

