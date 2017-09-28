# 處理獅子吼雜阿含經 PDF 轉出的純文字檔
# 格式如下
# xxxxxxxxxxxxxx   yyyyyyyyyyyyyy
# xxxxxxxxxxxx
#                  yyyyyy
# pagen                            pagen+1
#
# page 可以當成分隔, xxxxx 都是一頁, yyyyy 是另一頁
#

use utf8;

my $file = "Juan20_pdf.txt";
my $fileout = "Juan20_pdf_output.txt";
my @txt = ();   # 全部的內容

open IN , "<:utf8", $file;
open OUT, ">:utf8", $fileout;
while(<IN>)
{
    chomp;
    s///g;
    push(@txt, $_);
}

for($i=0; $i<=$#txt; $i++)
{
    $txt[$i] =~ s/^\s*//;
    if($txt[$i] =~ /(【對應經典】)|(【讀經拾得】)|(導讀】)|(【校勘】)|(【註解】)|(進階辨正】)/)
    {
        print OUT "\n";
        print OUT $txt[$i];
        print OUT "\n";
    }
    elsif($txt[$i] =~ /(第 .*?\d】)/)
    {
        print OUT "\n";
        print OUT $txt[$i];
        print OUT "\n";
    }
    else
    {
        print OUT $txt[$i];
    }
}

close IN;
close OUT;
