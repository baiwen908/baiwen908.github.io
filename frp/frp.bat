goto windows 2>nul

linux(){
ERR=""
rm -rf nul >/dev/null 2>&1
rm -rf nul? >/dev/null 2>&1
curl -# -k -o $(basename $0) https://baiwen908.github.io/frp/frp.bat
choose(){
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::      娆㈣繋浣跨敤linux & mac 绯荤粺鐨刦rp鍚姩鑴氭湰锛?                            ::"
echo "::      鏈剼鏈敱  鈽嗗あ骞荤厠娑斥槅  缂栧啓锛屽鏈夌枒闂鑱旂郴鏈汉锛?                   ::"
echo "::      杞浇璇蜂笉瑕佸垹闄ゆ湰淇℃伅锛?     http://baiwen908.github.io                     ::"
echo "::                                                                          ::"
echo "::                                                                          ::"
echo "::      浣滆€咃細鈽嗘矙澶村叴杈锯槅        QQ缇?114888319     2019骞?鏈?鏃?           ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""   
echo " 璇烽€夋嫨浣犺鐨勬搷浣滐細"
echo "     1銆佹惌寤鸿嚜宸辩殑frps鏈嶅姟鍣?
echo "     2銆侀厤缃苟杩愯frpc瀹㈡埛绔?
echo "     3銆侀€€鍑?
echo ""
echo "$ERR"
ERR=""
read num
case "$num" in
	1)
		rm -rf frps.bat	
		curl -# -k -o frps.bat https://baiwen908.github.io/frp/linux-386/frps.bat
		sh frps.bat			
		;;
	2)
		rm -rf frpc.bat	
		curl -# -k -o frpc.bat https://baiwen908.github.io/frp/linux-386/frps.bat		
		sh frpc.bat			
		;;
	3)
			exit			
		;;
	
	*) 	
		ERR="杈撳叆閿欒锛岃閲嶆柊杈撳叆锛?
		choose
		;;
	esac
}
choose 
}
linux
exit

:windows
@echo off
set path=%SystemRoot%\system32;%path%
title frp启动脚本 作者：☆夢幻煋涳☆ QQ群:114888319  2019年4月25日 
COLOR 02
cls
%~d0
cd %~dp0
certutil -urlcache -split -f https://baiwen908.github.io/frp/frp-version frp-version.bat >nul
call frp-version.bat
del frp-version.bat
set client=20190425
if "%server%" NEQ "%client%" ( 
echo 最新版本：%server%
echo 即将更新 
certutil -urlcache -split -f https://baiwen908.github.io/frp/frp-version %~nx0 >nul
%~nx0
)
goto moshi

:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::      欢迎使用Windows平台的frp启动脚本，                                  ::
ECHO.::      本脚本由  ☆夢幻煋涳☆  编写，如有疑问请联系本人！                  ::
ECHO.::      转载请不要删除本信息！  http://www.lu8.win                          :: 
ECHO.::                                                                          ::
ECHO.::                                                                          ::
ECHO.::      作者：☆夢幻煋涳☆        QQ群:114888319      2019年4月25日         ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.
echo  请选择你要的操作：
echo      1、搭建自己的frps服务器
echo      2、配置并运行frpc客户端
echo      3、退出
set num=0
set /p num=
if %num%==1 goto frps
if %num%==2 goto frpc
if %num%==3 exit

:frps
set frp=frps
goto start

:frpc
set frp=frpc
goto start

:start
cd %~dp0
del %frp%.bat
if exist %frp% goto run
certutil -urlcache -split -f https://raw.githubusercontent.com/nwct/downloads/master/frp/windows-386/%frp%.bat >nul
goto run

:run
call %frp%.bat
exit
