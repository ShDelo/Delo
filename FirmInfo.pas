unit FirmInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, ComCtrls, sRichEdit, sLabel,
  Buttons, sBitBtn, ShellApi, RichEdit;

type
  TFormFirmInfo = class(TForm)
    panelGeneral: TsPanel;
    panelAdvanced: TsPanel;
    lblFirmName: TsLabelFX;
    BtnNBAddRec: TsBitBtn;
    BtnPrint: TsBitBtn;
    BtnClose: TsBitBtn;
    lblID: TsLabel;
    reFirmInfo: TsRichEdit;
    BtnDocs: TsBitBtn;
    btnSendEmail: TsBitBtn;
    procedure BtnCloseClick(Sender: TObject);
    procedure reFirmInfoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MyRichEditWndProc(var msg: TMessage);
    procedure FormCreate(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnNBAddRecClick(Sender: TObject);
    procedure BtnDocsClick(Sender: TObject);
    procedure btnSendEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  protected
    procedure WndProc(var Message: TMessage); override;
  end;

var
  FormFirmInfo: TFormFirmInfo;
  OldRichEditWndProc: TWndMethod;

implementation

uses Main, NotebookAdd, MailSend, Notebook;

{$R *.dfm}

procedure TFormFirmInfo.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_Ex_AppWindow;
end;

procedure TFormFirmInfo.MyRichEditWndProc(var msg: TMessage);
begin
  OldRichEditWndProc(msg);
  if (msg.Msg = WM_PAINT) or (msg.Msg = WM_SETFOCUS) or (msg.Msg = WM_NCHITTEST) then
    HideCaret(reFirmInfo.Handle);
end;

procedure TFormFirmInfo.WndProc(var Message: TMessage);
var
  p: TENLink;
  strURL: string;
begin
  if (message.Msg = WM_NOTIFY) then
  begin
    if (PNMHDR(message.lParam).code = EN_LINK) then
    begin
      p := TENLink(Pointer(TWMNotify(message).NMHdr)^);
      if (p.Msg = WM_LBUTTONDOWN) then
      begin
        SendMessage(reFirmInfo.Handle, EM_EXSETSEL, 0, Longint(@(p.chrg)));
        strURL := reFirmInfo.SelText;
        reFirmInfo.SelLength := 0;
        ShellExecute(Handle, 'open', PChar(strURL), nil, nil, SW_SHOWNORMAL);
      end;
    end;
  end;
  inherited WndProc(message);
end;

procedure TFormFirmInfo.FormCreate(Sender: TObject);
var
  mask: Word;
begin
  OldRichEditWndProc := reFirmInfo.WindowProc;
  reFirmInfo.WindowProc := MyRichEditWndProc;
  reFirmInfo.Cursor := crArrow;
  mask := SendMessage(reFirmInfo.Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(reFirmInfo.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
  SendMessage(reFirmInfo.Handle, EM_AUTOURLDETECT, Integer(True), 0);
end;

procedure TFormFirmInfo.reFirmInfoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Key := 0;
end;

procedure TFormFirmInfo.BtnCloseClick(Sender: TObject);
begin
  FormFirmInfo.Close;
end;

procedure TFormFirmInfo.BtnPrintClick(Sender: TObject);
var
  ID: TStrings;
begin
  if Trim(lblID.Caption) <> '' then
  begin
    ID := TStringList.Create;
    ID.Add(lblID.Caption);
    FormNoteBook.PrintRecords(ID);
    ID.Free;
  end;
end;

procedure TFormFirmInfo.btnSendEmailClick(Sender: TObject);
begin
  MailSend.EMailScan_Break := False;
  FormMailSend.ClearEdits;
  FormMailSend.GetEmailList(1, nil, lblID.Caption, FormMailSend.editEmailList, True);
  FormMailSend.Show;
  FormMailSend.editTo.SetFocus;
end;

procedure TFormFirmInfo.BtnNBAddRecClick(Sender: TObject);
var
  ID: string;
begin
  ID := lblID.Caption;
  if Trim(ID) = '' then
    exit;
  FormNotebookAdd.lblID.Caption := ID;
  FormNotebookAdd.GetRubrList;
  FormNotebookAdd.ClearEdits;
  FormFirmInfo.Close;
  FormNoteBookAdd.Show;
  FormNotebookAdd.editRubr.SetFocus;
end;

procedure TFormFirmInfo.BtnDocsClick(Sender: TObject);
begin
  if FileExists(AppDoc + BtnDocs.Hint) then
    if ShellExecute(Handle, 'OPEN', PCHar(AppDoc + BtnDocs.Hint), nil, nil, SW_NORMAL) <= 32 then
      MessageBox(Handle, 'В операционной системе не установлена программа для просмотра файлов Microsoft Office (Open Office).' + #13 +
        'Установите программу и повторите попытку.', 'Предупреждение', MB_OK or MB_ICONWARNING);
end;

end.
