import os
import tempfile

from ripe.atlas.tools.commands.base import Command


hiddenimports = []
hiddenimports.append("OpenSSL")
hiddenimports.append("cffi")
commands = []
mod = "ripe.atlas.tools.commands.{}"
for command in Command.get_available_commands():
    hiddenimports.append(mod.format(command))
    commands.append(command)

tmp_dir = tempfile.mkdtemp()
with open(os.path.join(tmp_dir, "commands.list"), "w") as tmp:
    tmp.write(" ".join(commands))
datas = [
    (tmp.name, "",)
]
