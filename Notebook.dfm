object FormNoteBook: TFormNoteBook
  Left = 359
  Top = 210
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1047#1072#1087#1080#1089#1085#1072#1103' '#1082#1085#1080#1075#1072
  ClientHeight = 442
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sSplitter1: TsSplitter
    Left = 237
    Top = 0
    Width = 2
    Height = 424
    Cursor = crSizeWE
    AutoSnap = False
    MinSize = 165
    SkinData.SkinSection = 'SPLITTER'
  end
  object panelTree: TsPanel
    Left = 0
    Top = 0
    Width = 237
    Height = 424
    Align = alLeft
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object panelToolbar: TsPanel
      Left = 1
      Top = 1
      Width = 235
      Height = 26
      Align = alTop
      TabOrder = 0
      SkinData.SkinSection = 'BARPANEL'
      object BtnAddRubr: TsSpeedButton
        Left = 4
        Top = 2
        Width = 23
        Height = 22
        Hint = #1057#1086#1079#1076#1072#1090#1100' '#1088#1091#1073#1088#1080#1082#1091
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnAddRubrClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = FormMain.ImageList1
        ImageIndex = 17
      end
      object BtnDeleteRubr: TsSpeedButton
        Left = 52
        Top = 2
        Width = 23
        Height = 22
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1091#1073#1088#1080#1082#1091
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnDeleteRubrClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = FormMain.ImageList1
        ImageIndex = 19
      end
      object BtnRenameRubr: TsSpeedButton
        Left = 28
        Top = 2
        Width = 23
        Height = 22
        Hint = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1088#1091#1073#1088#1080#1082#1091
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnRenameRubrClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = FormMain.ImageList1
        ImageIndex = 20
      end
      object BtnSendEmailAll: TsSpeedButton
        Left = 80
        Top = 2
        Width = 23
        Height = 22
        Hint = #1056#1072#1089#1089#1099#1083#1082#1072' '#1087#1086#1095#1090#1099' '#1074#1089#1077#1084' '#1092#1080#1088#1084#1072#1084' '#1074' '#1088#1091#1073#1088#1080#1082#1077
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSendEmailAllClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = FormMain.ImageList1
        ImageIndex = 7
      end
      object btnPrintAll: TsSpeedButton
        Left = 104
        Top = 2
        Width = 23
        Height = 22
        Hint = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1092#1080#1088#1084' '#1074' '#1088#1091#1073#1088#1080#1082#1077
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = btnPrintAllClick
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = FormMain.ImageList1
        ImageIndex = 4
      end
      object btnDevider1: TsSpeedButton
        Left = 76
        Top = 4
        Width = 4
        Height = 19
        Flat = True
        ParentShowHint = False
        ShowHint = False
        ButtonStyle = tbsDivider
        SkinData.SkinSection = 'SPEEDBUTTON'
        Images = FormMain.ImageList1
        ImageIndex = 4
      end
    end
    object TVRubr: TsTreeView
      Left = 1
      Top = 27
      Width = 235
      Height = 396
      Align = alClient
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HideSelection = False
      HotTrack = True
      Images = FormMain.ImageList1
      Indent = 19
      ParentFont = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 1
      OnChange = TVRubrChange
      OnContextPopup = TVRubrContextPopup
      SkinData.SkinSection = 'EDIT'
    end
  end
  object panelGrid: TsPanel
    Left = 239
    Top = 0
    Width = 545
    Height = 424
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object SGNotebook: TNextGrid
      Left = 1
      Top = 1
      Width = 543
      Height = 422
      Touch.InteractiveGestures = [igPan, igPressAndTap]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
      Align = alClient
      AppearanceOptions = [aoHideFocus, aoHighlightSlideCells]
      AutoScroll = True
      Caption = ''
      GridLinesStyle = lsHorizontalOnly
      HeaderSize = 26
      Options = [goDisableColumnMoving, goGrid, goHeader, goSelectFullRow]
      RowSize = 18
      PopupMenu = PopupMenu1
      TabOrder = 0
      TabStop = True
      OnDblClick = SGNotebookDblClick
      object NxTextColumn1: TNxTextColumn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'NB.ID'
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        ParentFont = False
        Position = 0
        SortType = stAlphabetic
        Visible = False
      end
      object NxTextColumn2: TNxTextColumn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = 'BASE.ID'
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        ParentFont = False
        Position = 1
        SortType = stAlphabetic
        Visible = False
      end
      object NxTextColumn3: TNxTextColumn
        DefaultWidth = 300
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1088#1084#1099
        Header.DisplayMode = dmTextAndImage
        Header.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000080A8C0FF7098A0FF608890FF607890FF507080FF506880FF5060
          70FF506070FF0000000000000000000000000000000000000000000000000000
          00000000000030A0C0FFA0F0F0FF80E0F0FF70D0F0FF40C0E0FF30A8E0FF10A0
          D0FF507080FF506070FF00000000000000000000000000000000000000000000
          00000000000030A0C0FFA0F0FFFFA0E8F0FF80D8F0FF60C8F0FF40B8E0FF20A8
          E0FF507080FF10A0D0FF506070FF000000000000000000000000000000000000
          00000000000030A0C0FFA0F0FFFFA0F0FFFF90E8F0FF80D8F0FF50C8E0FF30B8
          E0FF507080FF10A0E0FF506070FF000000000000000000000000000000000000
          00000000000030A0C0FFA0F0FFFFA0F0FFFFA0F0FFFF90E8F0FF80D8F0FF50C0
          E0FF507080FF30B0E0FF506870FF000000000000000000000000000000000000
          00000000000030A0C0FF90C8E0FF90C0D0FF90B8D0FF80B8C0FF80A8C0FF7090
          A0FF507080FF70D0F0FF506880FF000000000000000000000000000000000000
          000030A0C0FF50C0E0FF507080FF0098D0FF1098D0FF20A0D0FF30B0E0FF50C0
          E0FF70D8F0FF507890FF60C8F0FF506070FF00000000000000000000000030A0
          C0FF70D8F0FF70D0F0FF60C8F0FF507890FF5080A0FF4080A0FF4088A0FF3090
          C0FF40A8D0FF30A0C0FF60C8F0FF60C8F0FF506070FF00000000000000000000
          000030A0C0FFA0F0FFFF30A0C0FF000000000000000000000000000000000000
          000000000000000000000098D0FF30B0E0FF7098B0FF00000000000000000000
          00000000000030A0C0FF00000000000000000000000000000000308040503080
          4090000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000030804040308040A0308040D03080
          40FF000000000000000000000000000000000000000000000000904840508040
          40C0000000FF703830500000000030804030308040E090D890FF60A860FF3080
          40FF00000000000000006068B0FF202870D0101010FF202840FFC06050FFF090
          90FFC06060FF000000FF00000000000000003080400050A0508050A050F03080
          40FF00000000000000003040B0C02058FFFF4050A0FF202030F0E07070FFFFC0
          C0FFF09090FF804040C0000000000000000000000000000000003080400050A0
          508000000000000000003040B0C080A0FFFF2058FFFF203070D0B0585050E070
          70FFC06050FF9048405000000000000000000000000000000000000000000000
          000000000000000000006068C0B03040B0C03040B0C06068B0FF}
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        ParentFont = False
        Position = 2
        Sorted = True
        SortType = stAlphabetic
        Width = 300
      end
      object NxTextColumn4: TNxTextColumn
        DefaultWidth = 230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Header.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Header.DisplayMode = dmTextAndImage
        Header.Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000B0A090FF6048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF604830FF6048
          30FF604830FF000000002048B080102890FF1030A07000000000B0A090FFFFFF
          FFFFE0E0E0FFE0E0E0FFE0D0D0FFD0C8C0FFD0C0C0FFD0B8B0FFD0B8B0FFD0B8
          B0FF604830FF000000007088E0FF1048FFFF102890FF00000000B0A090FFFFFF
          FFFFD0B8B0FFD0B8A0FFD0B0A0FFC0A890FFC0A090FFC09890FFC09890FFC0A8
          A0FF604830FF000000007088D0807088E0FF2040B05000000000B0A090FFFFFF
          FFFFD0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC09890FFC0A8
          A0FF604830FF00000000000000002040A0700000000000000000C0A890FFFFFF
          FFFFD0B8B0FFD0B8A0FFD0B0A0FFC0A890FFC0A090FFC09890FFC09890FFC0B0
          A0FF604830FF00000000000000004050B0FF0000000000000000C0A8A0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0E8E0FFF0E0E0FFC0B8
          B0FF604830FF00000000203890700038F0FF0018607000000000C0B0A0FFFFFF
          FFFFD0C0B0FFD0C0B0FFD0B8B0FFD0B0A0FFD0A8A0FFC0A890FFC0A890FFD0B8
          B0FF604830FF000000002040C0FF0038F0FF002890F000000000D0B0A0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0FFF0F0F0FFD0C0
          C0FF604830FF5068C0705070E0FF0040FFFF0030D0FF00185030D0B8A0FFFFFF
          FFFFE0C8C0FFE0C8C0FFD0C0B0FFD0B8B0FFD0B8B0FFF0E8E0FFD0D0D0FFD0C8
          C0FF604830FF5068C0C05078E0FF1048FFFF0040F0FF00186080D0B8B0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090FF604830FF6048
          30FF604830FF5068D0FF7090FFFF1050FFFF1040F0FF0028A0F0D0C0B0FFFFFF
          FFFFE0C8C0FFE0C8C0FFE0C8C0FFD0C0B0FFF0E8E0FFC0A890FFD0C8C0FF6048
          30FFD0B0A0906078D0FF8098FFFF3060FFFF1050FFFF1038C0F0E0C0B0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FF604830FFD0B0
          A090000000007088E0FF90A8F0FF80A0FFFF6080F0FF2040A0E0E0C0B0FFE0C0
          B0FFE0C0B0FFE0C0B0FFE0C0B0FFD0C0B0FFD0B8B0FFD0B0A0FFD0B0A0900000
          0000000000007088C0307088E0FF6078D0FF5068D0FF4068D020000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        ParentFont = False
        Position = 3
        SortType = stAlphabetic
        Width = 230
      end
    end
  end
  object sStatusBar1: TsStatusBar
    Left = 0
    Top = 424
    Width = 784
    Height = 18
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end
      item
        Width = 50
      end>
    SkinData.SkinSection = 'STATUSBAR'
  end
  object PopupMenu1: TPopupMenu
    Images = FormMain.ImageList1
    Left = 532
    Top = 353
    object nBtnFirmOpenInfo: TMenuItem
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1092#1080#1088#1084#1077
      ImageIndex = 8
      OnClick = SGNotebookDblClick
    end
    object nBtnNote_Data: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ImageIndex = 10
      OnClick = nBtnNote_DataClick
    end
    object nBtnSendEmail: TMenuItem
      Caption = #1056#1072#1089#1089#1099#1083#1082#1072' '#1087#1086#1095#1090#1099
      ImageIndex = 7
      OnClick = nBtnSendEmailClick
    end
    object NBtnNBPrintFirm: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 4
      OnClick = NBtnNBPrintFirmClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object NBtnNBDeleteFirm: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1088#1091#1073#1088#1080#1082#1080
      ImageIndex = 9
      OnClick = NBtnNBDeleteFirmClick
    end
  end
  object PopupMenu2: TPopupMenu
    Images = FormMain.ImageList1
    Left = 568
    Top = 353
    object NBtnAddRubr: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1088#1091#1073#1088#1080#1082#1091
      ImageIndex = 17
      ShortCut = 45
      OnClick = BtnAddRubrClick
    end
    object NBtnRenameRubr: TMenuItem
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1088#1091#1073#1088#1080#1082#1091
      ImageIndex = 20
      ShortCut = 113
      OnClick = BtnRenameRubrClick
    end
    object NBtnDeleteRubr: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1091#1073#1088#1080#1082#1091
      ImageIndex = 19
      ShortCut = 46
      OnClick = BtnDeleteRubrClick
    end
    object nDiveider1: TMenuItem
      Caption = '-'
    end
    object nSendEmailAll: TMenuItem
      Caption = #1056#1072#1089#1089#1099#1083#1082#1072' '#1087#1086#1095#1090#1099' '#1087#1086' '#1088#1091#1073#1088#1080#1082#1077
      ImageIndex = 7
      ShortCut = 16449
      OnClick = BtnSendEmailAllClick
    end
    object nPrintAll: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1074#1089#1077#1093' '#1092#1080#1088#1084' '#1074' '#1088#1091#1073#1088#1080#1082#1077
      ImageIndex = 4
      ShortCut = 16464
      OnClick = btnPrintAllClick
    end
  end
  object frxReport: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbNavigator, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41058.855128761580000000
    ReportOptions.LastChange = 41058.855128761580000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 604
    Top = 353
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 639
    Top = 353
  end
  object QueryNotebook: TIBCQuery
    Left = 435
    Top = 352
  end
  object IBDatabase1: TIBCConnection
    Port = '3050'
    LoginPrompt = False
    Left = 467
    Top = 352
  end
end
