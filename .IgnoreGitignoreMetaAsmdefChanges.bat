@echo off
git update-index --assume-unchanged com.dreadscripts.localization.core.asmdef
git update-index --assume-unchanged com.dreadscripts.localization.core.asmdef.meta
git update-index --assume-unchanged .gitignore

for /r %%f in (*.meta) do (
    git update-index --assume-unchanged "%%f"
)

echo Finished Marking Files As Unchanged
pause