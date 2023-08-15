#!/usr/bin/env python3


import argparse
import hashlib
import os.path
import re
import urllib.request

VERSION_REGEX = re.compile(r"verzun = \"[^\"]*\"")
URL_REGEX = re.compile(
    r"^\s*url \"(?P<url>https://.*)\"\n\s*sha256 \"(?P<sum>[A-Za-z0-9]+)\"",
    re.MULTILINE,
)


def main():
    parser = argparse.ArgumentParser(
        description="Bump the version of a package, and recalculate its SHA256"
        " sums from each URL"
    )
    parser.add_argument("formula", help="Name of the formula (NOT path)")
    parser.add_argument("version", help="New version number")
    args = parser.parse_args()

    formula = args.formula
    version = args.version

    print(f"Upgrading {formula} to {version}")

    formula_file = os.path.join("Formula", f"{formula}.rb")

    # TODO check if file is diffed

    # Read the formula file. We'll update the contents in memory as we go, then
    # write back to the file at the end
    print(f"Using formula file {formula_file}")
    with open(formula_file) as f:
        formula_content = f.read()

    # Update version number
    new_content = VERSION_REGEX.sub(f'verzun = "{version}"', formula_content)

    # Grab all asset URLs from the formula
    for match in URL_REGEX.finditer(formula_content):
        url = match.group("url").replace("#{verzun}", version)
        old_sum = match.group("sum")
        print(f"Recalculating SHA256 sum for {url}")
        # Download the file to recalculate sha256
        with urllib.request.urlopen(url) as response:
            new_sum = hashlib.sha256(response.read()).hexdigest()
        print(f"  {old_sum} => {new_sum}")
        # We're assuming the old sum only appears once in the file
        new_content = new_content.replace(old_sum, new_sum)

    # Write back to the file
    print(f"Modifying {formula_file}")
    with open(formula_file, "w") as f:
        f.write(new_content)


if __name__ == "__main__":
    main()
