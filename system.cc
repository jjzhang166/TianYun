#include <system.h>

QString System::RunCommand(QString c)
{
    FILE *fp = popen(c.toLocal8Bit(), "r");
    char buf[BUFSIZ] = {0};
    fread(buf, BUFSIZ, 1, fp);
    pclose(fp);
    return buf;
}

bool System::fast_install_slot()
{
    
}
