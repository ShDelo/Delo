unit MailSend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, sSpeedButton, StdCtrls, sListBox,
  sEdit, ExtCtrls, sPanel, ImgList, acAlphaImageList, IBQuery, IniFiles,
  MapiEmail, sGauge, sCheckBox, sMemo, sLabel;

type
  TFormMailSend = class(TForm)
    panelGeneral: TsPanel;
    btnCancel: TsSpeedButton;
    btnSend: TsSpeedButton;
    AlphaImageList: TsAlphaImageList;
    sGauge1: TsGauge;
    editTo: TsEdit;
    editEmailList: TsListBox;
    btnEmailAdd: TsSpeedButton;
    btnEmailDelete: TsSpeedButton;
    btnEmailClear: TsSpeedButton;
    sLabel1: TsLabel;
    ImageInfo: TImage;
    procedure btnSendClick(Sender: TObject);
    procedure ClearEdits;
    procedure btnEmailAddClick(Sender: TObject);
    procedure btnEmailDeleteClick(Sender: TObject);
    procedure btnEmailClearClick(Sender: TObject);
    procedure editToKeyPress(Sender: TObject; var Key: Char);
    procedure editEmailListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function IsValidEmail(const Value: string): Boolean;
    procedure GetEmailList(param: integer; Query: TIBQuery;
      ID: string; List: TsListBox; ListClear: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure CreateParams(var Params: TCreateParams); override;
    { Public declarations }
  end;

var
  FormMailSend: TFormMailSend;
  EMailScan_Break: Boolean = False;

implementation

uses Main;

{$R *.dfm}

{ TFormMailSend }

procedure TFormMailSend.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_Ex_AppWindow;
end;

procedure TFormMailSend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EMailScan_Break := True;
end;

procedure TFormMailSend.btnCancelClick(Sender: TObject);
begin
  FormMailSend.Close;
end;

procedure TFormMailSend.btnSendClick(Sender: TObject);
  procedure SendViaClient;
  var
    MAPISendMail: TMAPISendMail;
    i: integer;
  begin
    MAPISendMail := TMAPISendMail.Create;
    {  if MAPISendMail.Prerequisites.IsMapiAvailable then showmessage('MapiAvailable');
      if MAPISendMail.Prerequisites.IsClientAvailable then showmessage('ClientAvailable');}
    try
      for i := 0 to editEmailList.Count - 1 do
        MAPISendMail.AddRecipient(editEmailList.Items[i]);
      MAPISendMail.SendMail;
    finally
      MAPISendMail.Free;
    end;
  end;
begin
  if editEmailList.Items.Count = 0 then
  begin
    MessageBox(Handle, 'Необходимо указать получателя.', 'Информация', MB_OK or MB_ICONINFORMATION);
    editTo.SetFocus;
    exit;
  end;
  SendViaClient;
end;

procedure TFormMailSend.ClearEdits;
begin
  sGauge1.Visible := False;
  btnSend.Enabled := True;
  editTo.Text := '';
  editEmailList.Clear;
end;

procedure TFormMailSend.btnEmailAddClick(Sender: TObject);
begin
  if Trim(editTo.Text) = '' then
    exit;
  if not IsValidEmail(editTo.Text) then
  begin
    MessageBox(handle, 'Неверно указан адрес получателя.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  if editEmailList.Items.IndexOf(Trim(editTo.Text)) > -1 then
  begin
    MessageBox(handle, 'Этот адрес уже есть в списке.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  editEmailList.Items.Add(Trim(editTo.Text));
  editEmailList.MultiSelect := False;
  editEmailList.ItemIndex := editEmailList.Items.Count - 1;
  editEmailList.Selected[editEmailList.Items.Count - 1] := True;
  editEmailList.MultiSelect := False;
  editTo.Clear;
end;

procedure TFormMailSend.btnEmailDeleteClick(Sender: TObject);
var
  i: integer;
begin
  if editEmailList.ItemIndex = -1 then
    exit;
  i := editEmailList.ItemIndex;
  editEmailList.DeleteSelected;
  if (i > -1) and (i <= editEmailList.Items.Count - 1) then
    editEmailList.Selected[i] := True;
  if (editEmailList.ItemIndex = -1) and (editEmailList.Items.Count > 0) then
    editEmailList.ItemIndex := editEmailList.Items.Count - 1;
end;

procedure TFormMailSend.btnEmailClearClick(Sender: TObject);
begin
  if editEmailList.Items.Count = 0 then
    exit;
  if MessageBox(handle, 'Очистить список адресов?', 'Подтверждение',
    MB_YESNO or MB_ICONQUESTION) = MRYES then
    editEmailList.Clear;
end;

procedure TFormMailSend.editToKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btnEmailAddClick(btnEmailAdd);
  end;
end;

procedure TFormMailSend.editEmailListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 46 then
  begin
    Key := 0;
    btnEmailDeleteClick(btnEmailDelete);
  end;
end;

function TFormMailSend.IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: integer;
  begin
    Result := false;
    for i := 1 to Length(s) do
    begin
      if not (s[i] in ['a'..'z', 'A'..'Z', '0'..'9', '_', '-', '.', '&']) then
        exit;
    end;
    Result := true;
  end;
var
  i: integer;
  namePart, serverPart: string;
begin
  Result := false;
  i := Pos('@', Value);
  if i = 0 then
    exit;
  namePart := Copy(Value, 1, i - 1);
  serverPart := Copy(Value, i + 1, Length(Value));
  if (Length(namePart) = 0) or ((Length(serverPart) < 4)) then
    exit;
  i := Pos('.', serverPart);
  if (i = 0) or (i > (Length(serverPart) - 2)) then
    exit;
  Result := CheckAllowed(namePart) and CheckAllowed(serverPart);
end;

procedure TFormMailSend.GetEmailList(param: integer; Query: TIBQuery;
  ID: string; List: TsListBox; ListClear: Boolean);
var
  i: integer;
  email, tmp: string;
  inList: boolean;
  Q: TIBQuery;
begin
  if param = 0 then // работаем с Query
  begin
    if ListClear then
      List.Clear;
    if Query.RecordCount = 0 then
      exit;
    Query.Last;
    Query.First;
    for i := 0 to Query.RecordCount - 1 do
    begin
      email := '';
      if Query.FieldValues['EMAIL'] <> null then
        email := Query.FieldValues['EMAIL'];
      if Length(email) > 0 then
      begin
        if email[Length(email)] <> ',' then
          email := email + ',';
        while pos(',', email) > 0 do
        begin
          inList := False;
          tmp := copy(email, 0, pos(',', email));
          delete(email, 1, length(tmp));
          tmp := Trim(tmp);
          delete(tmp, length(tmp), 1);
          if not IsValidEmail(tmp) then
            inList := True;
          if List.Items.IndexOf(tmp) > -1 then
            inList := True;
          if not inList then
            List.Items.Add(tmp);
        end;
      end;
      Query.Next;
    end;
    if FormMain.IBDatabase1.Connected then
      FormMain.IBDatabase1.Close;
  end; {if param = 0 then}
  if param = 1 then // работаем с ID
  begin
    if ListClear then
      List.Clear;
    Q := TIBQuery.Create(FormMailSend);
    Q.Database := FormMain.IBDatabase1;
    Q.Transaction := FormMain.IBTransaction1;
    Q.Close;
    Q.SQL.Text := 'select EMAIL from BASE where ID = :ID';
    Q.ParamByName('ID').AsString := ID;
    Q.Open;
    if Q.RecordCount = 0 then
      exit;
    email := '';
    if Q.FieldValues['EMAIL'] <> null then
      email := Q.FieldValues['EMAIL'];
    if Length(email) > 0 then
    begin
      if email[Length(email)] <> ',' then
        email := email + ',';
      while pos(',', email) > 0 do
      begin
        inList := False;
        tmp := copy(email, 0, pos(',', email));
        delete(email, 1, length(tmp));
        tmp := Trim(tmp);
        delete(tmp, length(tmp), 1);
        if not IsValidEmail(tmp) then
          inList := True;
        if List.Items.IndexOf(tmp) > -1 then
          inList := True;
        if not inList then
          List.Items.Add(tmp);
      end;
    end;
    Q.Close;
    Q.Free;
  end; {if param = 1 then}
end;

end.
