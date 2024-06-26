# Development and Workflow Using this Template

## Introduction

This template is intended to be an opinionated starting point for developing Lua scripts for the monome norns. It includes a development workflow, recommended tools, and configurations to help with developing scripts. The template and workflow tasks are designed to be used with Visual Studio Code, but can be used with any editor.

## Table of Contents

- [Development and Workflow Using this Template](#development-and-workflow-using-this-template)
  - [Introduction](#introduction)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Recommended Installs](#recommended-installs)
    - [Quick Start](#quick-start)
  - [Workflow](#workflow)
    - [Structure – `bin/dev` folder](#structure--bindev-folder)
    - [Setting up `.env.development` file](#setting-up-envdevelopment-file)
    - [Tasks](#tasks)
      - [Task – Push script to norns](#task--push-script-to-norns)
      - [Task – Pull project data from norns](#task--pull-project-data-from-norns)
  - [Unit Testing](#unit-testing)
  - [Development Environment and Style Guide](#development-environment-and-style-guide)
    - [Template Structure](#template-structure)
    - [Documentation and Annotations](#documentation-and-annotations)
    - [Visual Studio Code – Configuration](#visual-studio-code--configuration)
      - [Installing Recommended Extensions](#installing-recommended-extensions)
    - [Lua Language Server – Configuration](#lua-language-server--configuration)

## Getting Started

To get started with the template, you can select ["Use this template"](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template) for this repository and make sure you have the necessary tools installed on your local machine.

### Prerequisites

- `rsync`: transferring and synchronizing files across the network – used for syncing script files to norns (see [Tasks](#tasks) for more information)
- `sshpass`: non-interactive ssh password provider – used by workflow tasks to quickly connecting to norns (see [Tasks](#tasks) for more information)
- [monome norns repo](https://github.com/monome/norns) - cloned locally for development – used for code completion, reference, and documentation

### Recommended Installs

These are the recommended tools and [extensions](#installing-recommended-extensions) for developing scripts for norns:

- [Visual Studio Code](https://code.visualstudio.com/) – Recommended editor for developing the Lua based scripts for norns locally
- [Lua Language Server extension](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) – Lua language server for Visual Studio Code with support for LuaCATS annotations. see the [Documentation and Annotations](#documentation-and-annotations) section for more information.
- [busted](https://github.com/lunarmodules/busted) – Lua unit testing framework and Visual Studio Code extension
- [norns REPL](https://marketplace.visualstudio.com/items?itemName=midouest.norns-repl) – interact with norns in a Visual Studio Code terminal

### Quick Start

1. Rename entry script – in the project root, rename the `template.lua` to the name of the script you are developing. For example, if you are developing a script called `drone monster`, rename the `main.lua` file to `drone_monster.lua`.
1. Update script name – in `.env.development`, update the `SCRIPT_NAME` variable to the name of your script. For example, if you are developing a script called `drone monster`, update the `SCRIPT_NAME` variable to `drone monster`.
1. Run push script task – Trigger a sync of your script to the norns device by running the provided Visual Studio Code task:

   - Open the command palette (`Cmd + Shift + P`)
   - Run the `Tasks: Run Task` command
   - Select `⤴ norns: push script`

   or running the following command from the project root:

   ```sh
   # run push to norns script
   $ bin/dev/push_to_norns.sh
   ```
1. Launch your script on the norns device – navigate to the `SELECT >` menu on the norns device and select your script to run it.

## Workflow

### Structure – `bin/dev` folder

All workflow related files are located in the `bin/dev` folder.

These files are *not synced* to the norns device and are only used for development purposes.

### Setting up `.env.development` file

The workflow scripts use a `.env.development` file to store environment variables. This file is *not synced* to the norns device and is only used for development purposes. The `.env.development` file should be created in the root of the project and should contain the following variables:

```sh
# .env.development default values
NORNS_USER=we
NORNS_HOST=norns.local
NORNS_PASSWORD=sleep
SCRIPT_NAME=goodnight # _important_ – update this to the name of your script
DESTINATION_PATH=/home/we/dust
EXCLUDES=(--exclude='.gitignore' --exclude='.git' --exclude='.gitkeep' --exclude='.Trashes' --exclude='.Spotlight-V100' --exclude='.fseventsd' --exclude='.env.development' --exclude='.env' --exclude='.vscode' --exclude='bin/dev')
```

### Tasks

These tasks are used to quickly run common development tasks such as syncing your script files to norns.

#### Task – Push script to norns

Quickly syncing changes to the norns device during development. The script files and contents of `lib/` and `audio/` will be copied to the `DESTINATION_PATH`/`SCRIPT_NAME` folder on the norns device (see [Setting up `.env.development` file](#setting-up-envdevelopment-file) for more information on the environment variables used in workflow tasks).

Using Visual Studio Code tasks:

- Open the command palette (`Cmd + Shift + P`)
- Run the `Tasks: Run Task` command
- Select `⤴ norns: push script`

or running the following command from the project root:

```sh
# run push to norns script
$ bin/dev/push_to_norns.sh
```

#### Task – Pull project data from norns

Task to pull the contents of the `dust/data/${SCRIPT_NAME}` folder from the norns device to the local workspace. This is useful for pulling recorded audio files, data, or other project files from the norns device to the local machine.

Using Visual Studio Code tasks:

- Open the command palette (`Cmd + Shift + P`)
- Run the `Tasks: Run Task` command
- Select `⤵ norns: pull project dust/data`

or running the following command from the project root:

```sh
# run pull project data from norns
$ bin/dev/pull_project_data_from_norns.sh
```

## Unit Testing

TODO: Add information and examples on how to setup and run unit tests for Lua scripts.

## Development Environment and Style Guide

Included with this template are some tools, configurations, and styling practices to help with developing Lua scripts for norns. You can use them or not, it's up to you.

### Template Structure

The template and its folders are structured as follows:
- `template.lua`: entry script which includes inline documentation and annotations
  - `screen_redraw_metro`: screen redraw metro based on dirty flag
  - `screen_dirty`: screen dirty flag – set to true to trigger screen redraw
  - stubs for `init()`, `cleanup()`, `enc()`, `key()`, and `redraw()` functions
- `lib/`: your libraries accessible using `include(…)` within the script. *This will be prune during push to norns if it is empty*.
- `audio/`: audio files used by the script. *This will be prune during push to norns if it is empty*.

### Documentation and Annotations

This template includes a lot of documentation and annotations that you can emulate and take on as a sort of style guide, as well as to help with understanding the code and how to get started. Annotations are written using [LuaCATS – Lua Comment And Type System]() for use with [Sumneko's Lua Language Server](https://github.com/LuaLS/lua-language-server).

### Visual Studio Code – Configuration

Included in this template is a `.vscode` folder that contains various file for Visual Studio Code:

- `extensions.json`: Recommended extensions for Visual Studio Code
- `settings.json`: Recommended workspace settings
- `tasks.json`: Workflow tasks – see [Tasks](#tasks) for more information

#### Installing Recommended Extensions

To install the recommended extensions for Visual Studio Code:

- Open the command palette (`Cmd + Shift + P`)
- Run the `Extensions: Show Recommended Extensions` command
- Install the recommended extensions

### Lua Language Server – Configuration

During script development, it is recommended to have the [monome norns repo](https://github.com/monome/norns) cloned locally. This will allow for the Lua Language Server to find the `norns` Lua library and provide code completion and documentation.

- Install the [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) extension (see [Installing Recommended Extensions](#installing-recommended-extensions))
- Setup the Lua Language Server to be able to find the `norns` Lua libraries. This is done by adding the following to your `settings.json` file in Visual Studio Code (replace `/path/to/norns/lua` with the path to the `lua` folder in the norns repo):

```json
// User or Workspace – settings.json
"Lua.workspace.library": [
    "/path/to/norns/lua",
]
```


