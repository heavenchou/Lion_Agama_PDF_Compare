# 處理獅子吼雜阿含經 wiki 的純文字檔


use utf8;

my $file = "Juan20_wiki.txt";
my $fileout = "Juan20_wiki_output.txt";
my @txt = ();   # 全部的內容
my @buff = ();  # 暫存二頁的內容

open IN , "<:utf8", $file;
open OUT, ">:utf8", $fileout;
while(<IN>)
{
    chomp;
    s/ⓐ/ 1 /g;
    s/ⓑ/ 2 /g;
    s/ⓒ/ 3 /g;
    s/ⓓ/ 4 /g;
    s/ⓔ/ 5 /g;
    s/ⓕ/ 6 /g;
    s/ⓖ/ 7 /g;
    s/ⓗ/ 8 /g;
    s/ⓘ/ 9 /g;
    s/ⓙ/ 10 /g;
    s/ⓚ/ 11 /g;
    s/ⓛ/ 12 /g;
    s/ⓜ/ 13 /g;
    s/ⓝ/ 14 /g;
    s/ⓞ/ 15 /g;
    s/ⓟ/ 16 /g;
    s/ⓠ/ 17 /g;
    s/ⓡ/ 18 /g;
    s/ⓢ/ 19 /g;
    s/ⓣ/ 20 /g;
    s/ⓤ/ 21 /g;
    s/ⓥ/ 22 /g;

    s/①/ 1 /g;
    s/②/ 2 /g;
    s/③/ 3 /g;
    s/④/ 4 /g;
    s/⑤/ 5 /g;
    s/⑥/ 6 /g;
    s/⑦/ 7 /g;
    s/⑧/ 8 /g;
    s/⑨/ 9 /g;
    s/⑩/ 10 /g;
    s/⑪/ 11 /g;
    s/⑫/ 12 /g;
    s/⑬/ 13 /g;
    s/⑭/ 14 /g;
    s/⑮/ 15 /g;
    s/⑯/ 16 /g;
    s/⑰/ 17 /g;
    s/⑱/ 18 /g;
    s/⑲/ 19 /g;
    s/⑳/ 20 /g;
    s/㉑/ 21 /g;
    s/㉒/ 22 /g;
    s/㉓/ 23 /g;
    s/㉔/ 24 /g;
    s/㉕/ 25 /g;
    s/㉖/ 26 /g;
    s/㉗/ 27 /g;
    s/㉘/ 28 /g;
    s/㉙/ 29 /g;
    s/㉚/ 30 /g;
    s/㉛/ 31 /g;
    s/㉜/ 32 /g;
    s/㉝/ 33 /g;
    s/㉞/ 34 /g;
    s/㉟/ 35 /g;
    s/㊱/ 36 /g;
    s/㊲/ 37 /g;
    s/㊳/ 38 /g;
    s/㊴/ 39 /g;
    s/㊵/ 40 /g;
    s/㊶/ 41 /g;
    s/㊷/ 42 /g;
    s/㊸/ 43 /g;
    s/㊹/ 44 /g;
    s/㊺/ 45 /g;
    s/㊻/ 46 /g;
    s/㊼/ 47 /g;
    s/㊽/ 48 /g;
    s/㊾/ 49 /g;
    s/㊿/ 50 /g;

    s/\[/【/g;
    s/\]/】/g;
    s/【＊】/ ＊ /g;
    s/【……】/……/g;
    if(/（[一二三四五六七八九〇]+）【/)
    {
        s/（/第 /;
        s/）/ 經/;
        s/一/1/g;
        s/二/2/g;
        s/三/3/g;
        s/四/4/g;
        s/五/5/g;
        s/六/6/g;
        s/七/7/g;
        s/八/8/g;
        s/九/9/g;
        s/〇/0/g;
    }
    s/【(導讀.*)】/$1/;
    s/【進階辨正】//;
    s/研討：.*//;

    push(@txt, $_);
}

for($i=0; $i<=$#txt; $i++)
{
    $txt[$i] =~ s/^\s*//;
    if($txt[$i] =~ /(對應經典】)|(讀經拾得)|(導讀】)|(校勘】)|(註解】)|(註釋】)|(進階辨正】)|(第 .*?\d\d】$)/)
    {
        print OUT "\n";
        print OUT $txt[$i] ;
        print OUT "\n";
    }
    else
    {
        print OUT $txt[$i] ;
    }
}

close IN;
close OUT;
