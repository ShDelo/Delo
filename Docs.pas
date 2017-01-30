unit Docs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, NxColumns, NxColumnClasses, NxScrollControl, ShellApi,
  NxCustomGridControl, NxCustomGrid, NxGrid, Buttons, sSpeedButton, sPanel;

type
  TFormDocs = class(TForm)
    SGDoc: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    panelAdvanced: TsPanel;
    btnClose: TsSpeedButton;
    btnDocOpen: TsSpeedButton;
    NxTextColumn3: TNxTextColumn;
    procedure btnCloseClick(Sender: TObject);
    procedure GetDocsList;
    procedure FormCreate(Sender: TObject);
    procedure btnDocOpenClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateParams(var Params: TCreateParams); override;
    { Public declarations }
  end;

var
  FormDocs: TFormDocs;

implementation

uses Main;

{$R *.dfm}

procedure TFormDocs.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_Ex_AppWindow;
end;

procedure TFormDocs.FormCreate(Sender: TObject);
begin
  GetDocsList;
end;

procedure TFormDocs.btnCloseClick(Sender: TObject);
begin
  FormDocs.Close;
end;

procedure TFormDocs.btnDocOpenClick(Sender: TObject);
var
  Doc: string;
begin
  if SGDoc.SelectedCount = 0 then
    exit;
  Doc := SGDoc.Cells[2, SGDoc.SelectedRow];
  if FileExists(AppDoc + Doc) then
    if ShellExecute(Handle, 'OPEN', PCHar(AppDoc + Doc), nil, nil, SW_NORMAL) <= 32 then
      MessageBox(Handle, 'В операционной системе не установлена программа для просмотра файлов Microsoft Office (Open Office).' + #13 +
        'Установите программу и повторите попытку.', 'Предупреждение', MB_OK or MB_ICONWARNING);
end;

procedure TFormDocs.GetDocsList;
var
  n, c: integer;
  str1, str2, doc_id, doc_name, doc_doc: string;
begin
  // REKLAMA_DOC_ListALL получен при запуске в FormMain.GetData;
  if REKLAMA_DOC_ListALL.Count = 0 then
    exit;
  SGDoc.BeginUpdate;
  SGDoc.ClearRows;
  for n := 0 to REKLAMA_DOC_ListALL.Count - 1 do
  begin
    str1 := REKLAMA_DOC_ListALL[n];
    c := 0;
    doc_id := '';
    doc_name := '';
    doc_doc := '';
    while pos('>', str1) > 0 do
    begin
      inc(c);
      str2 := copy(str1, 0, pos('>', str1));
      delete(str1, 1, length(str2));
      delete(str2, 1, 1);
      delete(str2, length(str2), 1);
      if c = 1 then
        doc_id := str2;
      if c = 2 then
        doc_name := str2;
      if c = 3 then
        doc_doc := str2;
    end;
    SGDoc.AddRow;
    SGDoc.Cells[0, SGDoc.LastAddedRow] := doc_id;
    SGDoc.Cells[1, SGDoc.LastAddedRow] := doc_name;
    SGDoc.Cells[2, SGDoc.LastAddedRow] := doc_doc;
  end;
  SGDoc.EndUpdate;
end;

end.
