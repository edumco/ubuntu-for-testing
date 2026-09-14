# Python Language Support

Testers and devs use multiple projects at the same machine causing version conflicts. 

Usually we combine Python virtual environment tools but each installation gets tied to the project. I decided to use UV Python manager for 2 main reasons: performance and easy of use.

It is a faster (Rust based) integrated solution (a single comand) that allows to:

- Install and update python versions:

```bash
$ uv list
cpython-3.13.15-linux-x86_64-gnu                   <download available>
cpython-3.13.15+freethreaded-linux-x86_64-gnu      <download available>
cpython-3.12.14-linux-x86_64-gnu                   <download available>
...
```

- Switch between versions

```bash
uv python install 3.13.1
py -V:Astral/CPython3.13.1
```

- Create and manage virtual environments

```bash
uv venv --python 3.11.6
```

- Install and manage python packages

```bash
uv pip install flask
```

## The Python script

- Install UV Python manager

- Install the latest stable Python (CPython is the official python version)

- Creates an alias for `python` (can cause conflicts on real old python projects)

- Adds UV update and cleanup commands to the end of ~/.update.sh

## References 

- https://medium.com/aidatatools/why-uv-is-the-best-thing-to-happen-to-the-python-ecosystem-in-a-decade-9b8bfa2dd9bd

- https://blog.appsignal.com/2025/09/24/switching-from-pip-to-uv-in-python-a-comprehensive-guide.html

- https://docs.astral.sh/uv/concepts/python-versions/#installing-a-python-version

- https://docs.astral.sh/uv/pip/packages/
