# norns – script template and development workflow

An opinionated template and workflow for developing scripts for the [monome norns sound computer](https://monome.org/docs/norns).

## What is this?

A solid starting point, and a workflow for developing locally, then syncing to the norns. This template is opinionated in that it provides style, structure, tools, and executable workflow tasks to help along the way. It's designed to be used with Visual Studio Code, but can be used with any editor.

See [DEVELOPMENT.md](bin/dev/DEVELOPMENT.md) for detailed information on the template and development workflow.

## Quick start

To get started with the template, you can select ["Use this template"](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template) for this repository and make sure you have the necessary tools installed on your local machine (see [DEVELOPMENT.md](bin/dev/DEVELOPMENT.md)).

Once you have a new project created from the template, follow these steps to get started:

1. Rename entry script – in the project root, rename the `template.lua` to the name of the script you are developing. For example, if you are developing a script called `drone monster`, rename the `main.lua` file to `drone_monster.lua`.
2. Update script name – in `.env.development`, update the `SCRIPT_NAME` variable to the name of your script. For example, if you are developing a script called `drone monster`, update the `SCRIPT_NAME` variable to `drone monster`.
3. Run push script task – Trigger a sync of your script to the norns device by running the provided Visual Studio Code task:

   - Open the command palette (`Cmd + Shift + P`)
   - Run the `Tasks: Run Task` command
   - Select `⤴ norns: push script`

   or running the following command from the project root:

   ```sh
   # run push to norns script
   $ bin/dev/push_to_norns.sh
   ```
4. Launch your script on the norns device – navigate to the `SELECT >` menu on the norns device and select your script to run it.

---

**📝: below is a scaffold of a README for your script. edit and update as you see fit.**

cut here ✁✁✁✁✁✁✁✁✁✁
---

# script title

-- a one-line description of the script

![alt text](/path/to/image.png "image caption (optional)")

-- a longer description of the script

## features

-- a list of features

- feature 1
- feature 2
- …

## requirements

- norns (version 240424+)
- grid
- crow
- midi (optional)
- …

## installation

from the [maiden REPL](https://monome.org/docs/norns/maiden/):

```
;install https://github.com/…
```

https://github.com/…

## documentation

-- basic usage

### controls

| encoder | description                         |
| ------- | ----------------------------------- |
| E1      | changes the value of something      |
| E2      | changes the value of something else |
| E3      | unassigned                          |

| key | description         |
| --- | ------------------- |
| K1  | does something      |
| K2  | does something else |
| K3  | unassigned          |

### parameters

-- details about script params and params menu

## links

-- links to community, discussion, videos, etc.

- [… on norns community](https://norns.community/)
- [llllllll.co/t/12345](https://llllllll.co/t/12345)
- …

## acknowledgements

-- shoutouts to others

## license

Distributed under the terms of the [GNU General Public License v3.0](LICENSE).