// cppdemo.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "FinderSDK.h"

TFNfind  find = (TFNfind)GetProcAddress(LoadLibrary(__T("finderlib.dll")),"_Find");

void __stdcall callback(FCHAR** buffer,int bufferCount, int totalCount,int ErrorCode){

	for(int i=0; i<bufferCount; i++){
       //wprintf(__T("%s\r\n"),*buffer);
	   printf(__T("%s\r\n"),*buffer);
	   buffer++;
	}
	 //sprintf();

}

int _tmain(int argc, _TCHAR* argv[])
{
	HMODULE  h = LoadLibrary(__T("finderlib.dll"));
	find = (TFNfind)GetProcAddress(h,"_Find");
	if(find != NULL){
		find((argc > 1)?argv[1]:__T(""), 
			callback, 
			(argc > 2)?argv[2]:__T(""),
			(argc > 3)?argv[3]:__T(""),
			100,
			0,
			true,
			false,
			false,
			false,
			true,
			1000); 
	}
	return 0;
}

