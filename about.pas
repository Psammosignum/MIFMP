unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, DOS, LCLIntf,Windows;

type

  { TFAbout }

  TFAbout = class(TForm)
    AboutText: TStaticText;
    BtnClose: TButton;
    ImgMIRP: TImage;
    ImgGPL: TImage;
    ImgCorn: TImage;
    LabelGPL: TLabel;
    LabelMIRP: TLabel;
    LabelCorn: TLabel;
    StaticText1: TStaticText;
    procedure AboutTextClick(Sender: TObject);
    procedure BtnDocsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImgCornClick(Sender: TObject);
    procedure ImgGPLClick(Sender: TObject);
    procedure ImgMIRPClick(Sender: TObject);
    procedure LabelCornClick(Sender: TObject);
    procedure LabelGPLClick(Sender: TObject);
    procedure LabelMIRPClick(Sender: TObject);
  private

  public

  end;

var
  FAbout: TFAbout;

implementation
function GetLocaleLanguage: string;
var
  LpcLCA   : array[0..19] of Char;
  LRetText : string;
begin
  FillChar(LpcLCA, SizeOf(LpcLCA), #0);
  GetLocaleInfo(LOCALE_SYSTEM_DEFAULT,LOCALE_SISO639LANGNAME,LpcLCA,Length(LpcLCA));
  Result := LpcLCA;
end;
{$R *.lfm}

{ TFAbout }

procedure Translate;
var
  Lang: string;
begin
  Lang := GetLocaleLanguage;

  with FAbout do

  begin
    if (Lang = 'zh') or (Lang = 'zh-cn') then
        begin
            AboutText.Caption:='此程序能将MIDI设备或MIDI文件内的输出转换为可自定义的键盘输出，最初的目的是为了与Roblox内的虚拟钢琴搭配使用，但也可以用作一个单纯的MIDI-键盘转换器。'+#13#10+'使用此软件时请尊重其他人并承认你使用了软件。'+#13#10#13#10+'本软件使用GPL v3协议，任何复制或修改、分发的版本需注明原作者。'+#13#10+'MIRP© GreatCorn, 2019-2020'+#13#10+'MIFMP© Psamotisignum, 2025'+#13#10+'此软件为免费软件：你在由自由软件基金会发行的GNU通用公共许可证3.0或更新的版本下可以随意分发或修改它。'+#13#10#13#10+'本程序旨在为用户提供帮助，不提供任何形式的保证，包括但不限于对适销性或适用于特定目的的默示保证。有关详细信息，请参阅GNU通用公共许可证。';
            StaticText1.Caption:='小贴士：将鼠标悬停在组件上可以查看它具体能做什么，按下End键可以停止播放MIDI文件';
            FAbout.Caption:='关于';
            Btnclose.Caption:='关闭';
        end;
  end;
end;

procedure TFAbout.AboutTextClick(Sender: TObject);
begin

end;



procedure TFAbout.BtnDocsClick(Sender: TObject);
begin
  OpenURL('https://greatcorn.github.io/MIRP/docs/About.htm');
end;

procedure TFAbout.FormCreate(Sender: TObject);
begin
  Translate;
end;



procedure TFAbout.ImgCornClick(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/GreatCornholio231432');
end;

procedure TFAbout.ImgGPLClick(Sender: TObject);
begin
  OpenURL('https://www.gnu.org/licenses/gpl-3.0.txt');
end;

procedure TFAbout.ImgMIRPClick(Sender: TObject);
begin
  OpenURL('https://greatcorn.github.io/MIRP');
end;

procedure TFAbout.LabelCornClick(Sender: TObject);
begin
  OpenURL('https://www.youtube.com/GreatCornholio231432');
end;

procedure TFAbout.LabelGPLClick(Sender: TObject);
begin
  OpenURL('https://www.gnu.org/licenses/gpl-3.0.txt');
end;

procedure TFAbout.LabelMIRPClick(Sender: TObject);
begin
  OpenURL('https://greatcorn.github.io/MIRP');
end;



end.

