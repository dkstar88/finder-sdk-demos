#pragma once

#define  FCHAR char

//结果回调函数
typedef void (__stdcall *TFNFindCallback)(FCHAR** buffer,int bufferCount, int totalCount,int ErrorCode);
//
typedef bool (__stdcall *TFNfind)(FCHAR* AStr,
									TFNFindCallback ACallback,
									FCHAR* ADir, FCHAR* AFilter,
									int ACount,
									int Afrom,
									bool ASpaceOr,
									bool AWholeWords,
									bool ACaseSensitive,
									bool AIncludeDir,
									bool AIncludeFiles,
									unsigned short ATimeoutMS);