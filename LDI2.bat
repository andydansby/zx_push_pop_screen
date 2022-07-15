cls

del 1LDI_2.tap

@bas2tap -a10 -sloader loader.bas basloader.tap

pasmo -v --tap LDI_method2.asm LDI_method2.tap LDI_method2.sym

copy /b basloader.tap + LDI_method2.tap  1LDI_2.tap

del LDI_method2.tap
del basloader.tap

@rem for Auto Running / testing of your compile
@rem https://fms.komkon.org/Speccy/
path=C:\zx emulator\speccy
Speccy -48 -nosound 1LDI_2.tap


