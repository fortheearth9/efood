@echo off
setlocal enabledelayedexpansion
for %%i in (Menu Register Login Profile TableSettings DishSettings PrintSettings Order Checkout Report About) do (
    set "name=%%~i"
    set "name=!name: =_!"
    set "name=!name:A=a!"
    set "name=!name:B=b!"
    set "name=!name:C=c!"
    set "name=!name:D=d!"
    set "name=!name:E=e!"
    set "name=!name:F=f!"
    set "name=!name:G=g!"
    set "name=!name:H=h!"
    set "name=!name:I=i!"
    set "name=!name:J=j!"
    set "name=!name:K=k!"
    set "name=!name:L=l!"
    set "name=!name:M=m!"
    set "name=!name:N=n!"
    set "name=!name:O=o!"
    set "name=!name:P=p!"
    set "name=!name:Q=q!"
    set "name=!name:R=r!"
    set "name=!name:S=s!"
    set "name=!name:T=t!"
    set "name=!name:U=u!"
    set "name=!name:V=v!"
    set "name=!name:W=w!"
    set "name=!name:X=x!"
    set "name=!name:Y=y!"
    set "name=!name:Z=z!"
    echo import 'package:flutter/material.dart'; > !name!_page.dart
    echo class !name!Page extends StatelessWidget { >> !name!_page.dart
    echo const !name!Page^(Key? key^) : super^(key: key^); >> !name!_page.dart
    echo @override >> !name!_page.dart
    echo Widget build^(BuildContext context^) { >> !name!_page.dart
    echo return Scaffold^( >> !name!_page.dart
    echo appBar: AppBar^( >> !name!_page.dart
    echo title: const Text^('%%~i'^), >> !name!_page.dart
    echo ^), >> !name!_page.dart
    echo body: const Center^( >> !name!_page.dart
    echo child: Text^('%%~i页面'^), >> !name!_page.dart
    echo ^), >> !name!_page.dart
    echo ^); >> !name!_page.dart
    echo } >> !name!_page.dart
)