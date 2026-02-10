import os

# Root folder = folder where script is executed
ROOT = os.getcwd()


def get_xml_files():
    """Return list of XML files in root directory"""
    return [f for f in os.listdir(ROOT) if f.lower().endswith(".xml")]


def ask_user_selection(xml_files):
    """Allow user to select which XML files to process"""
    print("\nAvailable XML files:\n")

    for i, file in enumerate(xml_files, 1):
        print(f"{i}. {file}")

    choice = input("\nEnter numbers to process (comma separated) OR 'all': ").strip()

    if choice.lower() == "all":
        return xml_files

    selected = []
    for idx in choice.split(","):
        try:
            selected.append(xml_files[int(idx.strip()) - 1])
        except (ValueError, IndexError):
            print(f"Skipping invalid selection: {idx}")

    return selected


def create_folder_structure(xml_file):
    """Create B / BSplit / BSplitXML folders"""

    base_name = os.path.splitext(xml_file)[0]

    base_dir = os.path.join(ROOT, base_name)
    split_dir = os.path.join(base_dir, "Split")
    split_xml_dir = os.path.join(base_dir, "SplitXML")

    os.makedirs(split_dir, exist_ok=True)
    os.makedirs(split_xml_dir, exist_ok=True)

    print(f"Created folders for: {base_name}")


def main():
    xml_files = get_xml_files()

    if not xml_files:
        print("No XML files found in root folder.")
        return

    selected_files = ask_user_selection(xml_files)

    if not selected_files:
        print("No valid files selected.")
        return

    print("\nCreating folder structures...\n")

    for xml in selected_files:
        create_folder_structure(xml)

    print("\nDone ✔")


if __name__ == "__main__":
    main()