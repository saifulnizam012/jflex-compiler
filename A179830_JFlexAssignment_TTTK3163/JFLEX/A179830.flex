%%

%public
%class StudentInfo
%standalone

sainum = [0-9]
saimatricnum = A{sainum}{6}
saifaculty = [A-Z\&\ ]+
saiword = [A-Z\ ]+
saiyear = {sainum}{4}\/{sainum}{4}
saifee = {sainum}+\,{sainum}{3}\.{sainum}{2}
saispace = [\ \t\r\n]

%state NAME,saifee,REST

%{init
    yybegin(REST);
%init}

%%
<REST> {
    "SDR "| "SDRI " {
        yybegin(NAME);
    }

    "FAKULTI : "{saifaculty} {
        System.out.println("faculty: " + yytext().split(":")[1]);
    }

    "PROGRAM PENGAJIAN : "{saiword} {
        System.out.println("Program of Study: " + yytext().split(":")[1]);
    }

    "tempoh pengajian " {
        yybegin(saifee);
    }

    {saiyear} {
        System.out.println("Start Session: " + yytext());
    }
}

<NAME> {
    {saiword} {
       System.out.println("Name: " + yytext());
       yybegin(REST); 
    }
}

<saifee> {
    {saifee} {
        System.out.println("Tuition fee: " + yytext());
        yybegin(REST);
    }
}

{saispace} {}

.   {}