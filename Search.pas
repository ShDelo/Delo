unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sStatusBar, StdCtrls, sEdit, Buttons, sSpeedButton,
  ExtCtrls, sPanel, NxColumns, NxColumnClasses, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, sComboBox, IBC;

type
  TFormSearch = class(TForm)
    sPanel1: TsPanel;
    BtnSearch: TsSpeedButton;
    editSearch: TsEdit;
    SGSearch: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    editSearchIn: TsComboBox;
    sStatusBar: TsStatusBar;
    procedure ClearEdits;
    procedure BtnSearchClick(Sender: TObject);
    procedure editSearchKeyPress(Sender: TObject; var Key: Char);
    procedure SGSearchDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  FormSearch: TFormSearch;

implementation

uses Main, DateUtils;

{$R *.dfm}

procedure TFormSearch.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_Ex_AppWindow;
end;

procedure TFormSearch.FormCreate(Sender: TObject);
begin
  SGSearch.OnAfterSort := FormMain.SGAfterSort;
end;

procedure TFormSearch.ClearEdits;
begin
  editSearch.Clear;
  editSearchIn.ItemIndex := 0;
  SGSearch.ClearRows;
  sStatusBar.Panels[0].Text := 'Найдено фирм: 0';
end;

procedure TFormSearch.editSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BtnSearchClick(BtnSearch);
    Key := #0;
  end;
end;

procedure TFormSearch.BtnSearchClick(Sender: TObject);
var
  SearchString, Request: string;
  QuerySearch: TIBCQuery;
  i: integer;

  procedure SubSearching(Query, Param: string);
  var
    x: integer;
  begin
    QuerySearch := QueryCreate;
    QuerySearch.Close;
    QuerySearch.SQL.Text := Query;
    QuerySearch.Params[0].AsString := Param;
    QuerySearch.Open;
    QuerySearch.FetchAll := True;
    SGSearch.BeginUpdate;
    for x := 1 to QuerySearch.RecordCount do
    begin
      SGSearch.AddRow;
      SGSearch.Cells[0, SGSearch.LastAddedRow] := QuerySearch.FieldValues['ID'];
      SGSearch.Cells[1, SGSearch.LastAddedRow] := QuerySearch.FieldValues['NAME'];
      QuerySearch.Next;
    end;
    SGSearch.EndUpdate;
    sStatusBar.Panels[0].Text := 'Найдено фирм: ' + IntToStr(QuerySearch.RecordCount);
    QuerySearch.Close;
    QuerySearch.Free;
    FormMain.IBDatabase1.Close;
  end;

begin
  try
    try
      SearchString := AnsiLowerCase(Trim(editSearch.Text));
      SGSearch.ClearRows;
      if SearchString = '' then
        exit;
      Request := '';
      if editSearchIn.ItemIndex = 0 then
      begin { Название фирмы }
        SubSearching('select * from BASE where (lower(NAME) like :NAME) and (ACTIVITY = 1)', '%' + SearchString + '%');
      end
      else if editSearchIn.ItemIndex = 1 then
      begin { Город }
        QuerySearch := QueryCreate;
        QuerySearch.Close;
        QuerySearch.SQL.Text := 'select * from GOROD where lower(NAME) like :NAME';
        QuerySearch.ParamByName('NAME').AsString := '%' + SearchString + '%';
        QuerySearch.Open;
        QuerySearch.FetchAll := True;
        if QuerySearch.RecordCount = 0 then
        begin
          QuerySearch.Close;
          QuerySearch.Free;
          sStatusBar.Panels[0].Text := 'Найдено фирм: 0';
          SGSearch.Resort;
          exit;
        end;
        for i := 1 to QuerySearch.RecordCount do
        begin
          Request := Request + 'lower(ADRES) like ''%#^' + QuerySearch.FieldByName('ID').AsString + '$%'' or ';
          QuerySearch.Next;
        end;
        delete(Request, Length(Request) - 2, 3);
        Request := 'select * from BASE where (' + Request + ') and (ACTIVITY = 1)';
        QuerySearch.Close;
        // showmessage(Request);
        QuerySearch.SQL.Text := Request;
        QuerySearch.Open;
        QuerySearch.FetchAll := True;
        SGSearch.BeginUpdate;
        for i := 1 to QuerySearch.RecordCount do
        begin
          SGSearch.AddRow;
          SGSearch.Cells[0, SGSearch.LastAddedRow] := QuerySearch.FieldValues['ID'];
          SGSearch.Cells[1, SGSearch.LastAddedRow] := QuerySearch.FieldValues['NAME'];
          QuerySearch.Next;
        end;
        SGSearch.EndUpdate;
        sStatusBar.Panels[0].Text := 'Найдено фирм: ' + IntToStr(QuerySearch.RecordCount);
        QuerySearch.Close;
        QuerySearch.Free;
        FormMain.IBDatabase1.Close;
      end
      else if editSearchIn.ItemIndex = 2 then
      begin { Телефон }
        SubSearching('select * from BASE where (lower(PHONES) like :PHONES) and (ACTIVITY = 1)', '%' + SearchString + '%');
      end
      else if editSearchIn.ItemIndex = 3 then
      begin { Адрес }
        SubSearching('select * from BASE where (lower(ADRES) like :ADRES) and (ACTIVITY = 1)', '%' + SearchString + '%');
      end
      else if editSearchIn.ItemIndex = 4 then
      begin { Руководитель }
        SubSearching('select * from BASE where (lower(FIO) like :FIO) and (ACTIVITY = 1)', '%' + SearchString + '%');
      end
      else if editSearchIn.ItemIndex = 5 then
      begin { Эл. страница }
        SubSearching('select * from BASE where (lower(WEB) like :WEB) and (ACTIVITY = 1)', '%' + SearchString + '%');
      end
      else if editSearchIn.ItemIndex = 6 then
      begin { Эл. почта }
        SubSearching('select * from BASE where (lower(EMAIL) like :EMAIL) and (ACTIVITY = 1)', '%' + SearchString + '%');
      end
      else if editSearchIn.ItemIndex = 7 then
      begin { Деятельность }
        QuerySearch := QueryCreate;
        QuerySearch.Close;
        QuerySearch.SQL.Text := 'select * from NAPRAVLENIE where lower(NAME) like :NAME';
        QuerySearch.ParamByName('NAME').AsString := '%' + SearchString + '%';
        QuerySearch.Open;
        QuerySearch.FetchAll := True;
        if QuerySearch.RecordCount = 0 then
        begin
          QuerySearch.Close;
          QuerySearch.Free;
          sStatusBar.Panels[0].Text := 'Найдено фирм: 0';
          SGSearch.Resort;
          exit;
        end;
        for i := 1 to QuerySearch.RecordCount do
        begin
          Request := Request + 'NAPRAVLENIE like ''%#' + QuerySearch.FieldByName('ID').AsString + '$%'' or ';
          QuerySearch.Next;
        end;
        delete(Request, Length(Request) - 2, 3);
        Request := 'select * from BASE where (' + Request + ') and (ACTIVITY = 1)';
        QuerySearch.Close;
        QuerySearch.SQL.Text := Request;
        // showmessage(Request); exit;
        QuerySearch.Open;
        QuerySearch.FetchAll := True;
        SGSearch.BeginUpdate;
        for i := 1 to QuerySearch.RecordCount do
        begin
          SGSearch.AddRow;
          SGSearch.Cells[0, SGSearch.LastAddedRow] := QuerySearch.FieldValues['ID'];
          SGSearch.Cells[1, SGSearch.LastAddedRow] := QuerySearch.FieldValues['NAME'];
          QuerySearch.Next;
        end;
        SGSearch.EndUpdate;
        sStatusBar.Panels[0].Text := 'Найдено фирм: ' + IntToStr(QuerySearch.RecordCount);
        QuerySearch.Close;
        QuerySearch.Free;
        FormMain.IBDatabase1.Close;
      end;
    except
      on E: Exception do
        MessageBox(Handle, PChar('Произошла ошибка при поиске:' + #13 + E.Message), 'Ошибка', MB_OK or MB_ICONERROR);
    end
  finally
    SGSearch.Resort;
    FormMain.IBDatabase1.Close;
  end;
end;

procedure TFormSearch.SGSearchDblClick(Sender: TObject);
var
  ID: string;
begin
  if SGSearch.SelectedCount = 0 then
    exit;
  ID := SGSearch.Cells[0, SGSearch.SelectedRow];
  if Trim(ID) = '' then
    exit;
  FormMain.OpenFirmByID(ID, True);
end;

end.
