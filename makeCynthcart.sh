echo ** CYNTHCART BUILDER BATCH SCRIPT **
cd source
echo ___________________________________________________________________________________________
echo ASSEMBLING CYNTHCART FOR STANDARD HARDWARE
dasm cynthcart.asm -f3 -v1 -o../bin/cynthcart.prg -DMODE=1 -DDEVICE_CONFIG=0
echo ___________________________________________________________________________________________
echo ASSEMBLING CYNTHCART FOR KERBEROS CARTRIDGE
dasm cynthcart.asm -f3 -v1 -o../bin/cynthcart_kerberos.prg -DMODE=1 -DDEVICE_CONFIG=1
echo ___________________________________________________________________________________________
echo ASSEMBLING CYNTHCART FOR EMULATION
dasm cynthcart.asm -f3 -v1 -o../bin/cynthcart_emu.prg -DMODE=1 -DDEVICE_CONFIG=2
echo ___________________________________________________________________________________________
echo ASSEMBLING CYNTHCART FOR USE WITH SID SYMPHONY
dasm cynthcart.asm -f3 -v1 -o../bin/cynthcart_symphony.prg -DMODE=1 -DDEVICE_CONFIG=3
echo ___________________________________________________________________________________________
@echo ASSEMBLING CYNTHCART FOR USE WITH MIDD01
dasm cynthcart.asm -f3 -v1 -o../bin/cynthcart_midd01.prg -DMODE=1 -DDEVICE_CONFIG=4
dasm cynthcart.asm -f3 -v1 -o../bin/cynthcart_midd01.bin -DMODE=2 -DDEVICE_CONFIG=4
echo ___________________________________________________________________________________________
echo ASSEMBLING CYNTHCART BIN FOR 8K CARTRIDGE
dasm cynthcart.asm -f3 -v1 -o../bin/cynthcartUncompressed.bin -DMODE=2 -DDEVICE_CONFIG=0
dasm cynthcart.asm -f3 -v1 -o../bin/cynthcart_midd01.bin -DMODE=2 -DDEVICE_CONFIG=4
echo .   
echo COMPRESSING CYNTHCART CARTRIDGE BIN WITH PUNCRUNCH
pucrunch ../bin/cynthcartUncompressed.bin ../bin/cynthcartRawCompressed.bin -c64 -l0x3000 -x0x3000 -d -m6 -ffast -fdelta
pucrunch ../bin/cynthcart_midd01.bin ../bin/cynthcart_midd01_RawCompressed.bin -c64 -l0x3000 -x0x3000 -d -m6 -ffast -fdelta
echo ASSEMBLING CARTRIDGE LOADER
dasm cynthloader.asm -f3 -v1 -o../bin/cynthcart_cartridge_ROM.bin -DMODE=0 -l../bin/loaderSymbolList.txt
dasm cynthloader_midd01.asm -f3 -v1 -o../bin/cynthcart_cartridge_midd01_ROM.bin -DMODE=0 -l../bin/loaderSymbolList.txt
echo -------------------------------------------------------------------------------------------
ls -l ../bin/cynthcart_cartridge_ROM.bin 
ls -l ../bin/cynthcart_cartridge_midd01_ROM.bin 
echo ___________________________________________________________________________________________
echo ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-= ~-=
echo -------------------------------------------------------------------------------------------
cd ..
echo DONE
