
@x
octa mmix_fopen @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fopen(handle,name,mode)
  unsigned char handle;
  octa name,mode;
{
  char name_buf[FILENAME_MAX];
  if (mode.h || mode.l>4) goto abort;
  if (mmgetchars(name_buf,FILENAME_MAX,name,0)==FILENAME_MAX) goto abort;
  if (sfile[handle].mode!=0 && handle>2) fclose(sfile[handle].fp);
  sfile[handle].fp=fopen(name_buf,mode_string[mode.l]);
  if (!sfile[handle].fp) goto abort;
  sfile[handle].mode=mode_code[mode.l];
  return zero_octa; /* success */
 abort: sfile[handle].mode=0;
@y
octa mmix_fopen @,@,@[ARGS((unsigned int,octa,octa))@];@+@t}\6{@>
octa mmix_fopen(handle,name,mode)
  unsigned int handle;
  octa name,mode;
{
  char name_buf[FILENAME_MAX];
  if (mode.h || mode.l>4) goto failure;
  if (mmgetchars(name_buf,FILENAME_MAX,name,0)==FILENAME_MAX) goto failure;
  if (sfile[handle].mode!=0 && handle>2) fclose(sfile[handle].fp);
  sfile[handle].fp=fopen(name_buf,mode_string[mode.l]);
  if (!sfile[handle].fp) goto failure;
  sfile[handle].mode=mode_code[mode.l];
  return zero_octa; /* success */
  failure: sfile[handle].mode=0;
@z

@x
octa mmix_fclose @,@,@[ARGS((unsigned char))@];@+@t}\6{@>
octa mmix_fclose(handle)
  unsigned char handle;
@y
octa mmix_fclose @,@,@[ARGS((unsigned int))@];@+@t}\6{@>
octa mmix_fclose(handle)
  unsigned int handle;
@z

@x
octa mmix_fread @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fread(handle,buffer,size)
  unsigned char handle;
@y
octa mmix_fread @,@,@[ARGS((unsigned int,octa,octa))@];@+@t}\6{@>
octa mmix_fread(handle,buffer,size)
  unsigned int handle;
@z

@x
  n=fread(buf,1,size.l,sfile[handle].fp);
@y
  n=(int)fread(buf,1,size.l,sfile[handle].fp);
@z
@x
octa mmix_fgets @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fgets(handle,buffer,size)
  unsigned char handle;
@y
octa mmix_fgets @,@,@[ARGS((unsigned int,octa,octa))@];@+@t}\6{@>
octa mmix_fgets(handle,buffer,size)
  unsigned int handle;
@z

@x
if (size.l<s && !size.h) s=size.l;
@y
if (size.l<(unsigned int)s && !size.h) s=size.l;
@z

@x
octa mmix_fgetws @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fgetws(handle,buffer,size)
  unsigned char handle;
@y
octa mmix_fgetws @,@,@[ARGS((unsigned int,octa,octa))@];@+@t}\6{@>
octa mmix_fgetws(handle,buffer,size)
  unsigned int handle;
@z

@x
if (size.l<s && !size.h) s=size.l;
@y
if (size.l<(unsigned int)s && !size.h) s=size.l;
@z

@x
octa mmix_fwrite @,@,@[ARGS((unsigned char,octa,octa))@];@+@t}\6{@>
octa mmix_fwrite(handle,buffer,size)
  unsigned char handle;
@y
octa mmix_fwrite @,@,@[ARGS((unsigned int,octa,octa))@];@+@t}\6{@>
octa mmix_fwrite(handle,buffer,size)
  unsigned int handle;
@z

@x
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return ominus(zero_octa,size);
@y
    if ((int)fwrite(buf,1,n,sfile[handle].fp)!=n) return ominus(zero_octa,size);
@z

@x
octa mmix_fputs @,@,@[ARGS((unsigned char,octa))@];@+@t}\6{@>
octa mmix_fputs(handle,string)
  unsigned char handle;
@y
octa mmix_fputs @,@,@[ARGS((unsigned int,octa))@];@+@t}\6{@>
octa mmix_fputs(handle,string)
  unsigned int handle;
@z

@x
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return neg_one;
@y
    if ((int)fwrite(buf,1,n,sfile[handle].fp)!=n) return neg_one;
@z
@x
octa mmix_fputws @,@,@[ARGS((unsigned char,octa))@];@+@t}\6{@>
octa mmix_fputws(handle,string)
  unsigned char handle;
@y
octa mmix_fputws @,@,@[ARGS((unsigned int,octa))@];@+@t}\6{@>
octa mmix_fputws(handle,string)
  unsigned int handle;
@z

@x
    if (fwrite(buf,1,n,sfile[handle].fp)!=n) return neg_one;
@y
    if ((int)fwrite(buf,1,n,sfile[handle].fp)!=n) return neg_one;
@z

@x
octa mmix_fseek @,@,@[ARGS((unsigned char,octa))@];@+@t}\6{@>
octa mmix_fseek(handle,offset)
  unsigned char handle;
@y
octa mmix_fseek @,@,@[ARGS((unsigned int,octa))@];@+@t}\6{@>
octa mmix_fseek(handle,offset)
  unsigned int handle;
@z

@x
octa mmix_ftell @,@,@[ARGS((unsigned char))@];@+@t}\6{@>
octa mmix_ftell(handle)
  unsigned char handle;
@y
octa mmix_ftell @,@,@[ARGS((unsigned int))@];@+@t}\6{@>
octa mmix_ftell(handle)
  unsigned int handle;
@z
