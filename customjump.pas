unit customJump;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,Windows;

type

  { TFJump }

  TFJump = class(TForm)
    JumpCancel: TButton;
    JumpOk: TButton;
    JumpInput: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure JumpInputChange(Sender: TObject);
    procedure JumpOkClick(Sender: TObject);
  private

  public

  end;

var
  FJump: TFJump;
  CustomJumpResult: integer;

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

{ TFJump }
procedure Translate;
var
  Lang: string;
begin
  Lang := GetLocaleLanguage;

  with FJump do

  begin
    if (Lang = 'zh') or (Lang = 'zh-cn') then
        begin
            FJump.Caption:='自定跳过步数';
            JumpCancel.Caption:='取消';
            JumpOK.Caption:='确定';
            JumpInput.Caption:='跳过的步数';
            JumpInput.EditLabel.Caption:='请输入要跳过的步数（解析的MIDI事件步数）';
        end;
  end;
end;
procedure TFJump.JumpInputChange(Sender: TObject);
var
  intval: integer;
begin
  Val(JumpInput.Text, intval);
  JumpInput.Text := IntToStr(intval);
end;

procedure TFJump.FormCreate(Sender: TObject);
begin
    Translate;
end;

procedure TFJump.JumpOkClick(Sender: TObject);
begin
  Val(JumpInput.Text, CustomJumpResult);
end;

end.

