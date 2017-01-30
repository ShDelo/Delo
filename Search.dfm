object FormSearch: TFormSearch
  Left = 443
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1087#1086#1080#1089#1082
  ClientHeight = 455
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 197
    Height = 436
    Align = alLeft
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object BtnSearch: TsSpeedButton
      Left = 96
      Top = 108
      Width = 93
      Height = 31
      Caption = #1055#1086#1080#1089#1082
      Flat = True
      NumGlyphs = 2
      Spacing = 0
      OnClick = BtnSearchClick
      SkinData.SkinSection = 'PAGECONTROL'
      DisabledGlyphKind = []
      ImageIndex = 0
      Images = FormMain.ImgList_MultiState
    end
    object editSearch: TsEdit
      Left = 4
      Top = 20
      Width = 186
      Height = 21
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = editSearchKeyPress
      SkinData.SkinSection = 'ALPHAEDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072':'
      BoundLabel.Indent = 3
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clBlack
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object editSearchIn: TsComboBox
      Left = 4
      Top = 68
      Width = 185
      Height = 21
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = #1048#1089#1082#1072#1090#1100' '#1074':'
      BoundLabel.Indent = 2
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clBlack
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'ALPHAEDIT'
      Style = csDropDownList
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 15
      ItemIndex = -1
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1088#1084#1099
        #1043#1086#1088#1086#1076
        #1058#1077#1083#1077#1092#1086#1085
        #1040#1076#1088#1077#1089
        #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
        #1069#1083'. '#1089#1090#1088#1072#1085#1080#1094#1072
        #1069#1083'. '#1087#1086#1095#1090#1072)
    end
  end
  object SGSearch: TNextGrid
    Left = 197
    Top = 0
    Width = 491
    Height = 436
    Align = alClient
    AppearanceOptions = [aoBoldTextSelection, aoHideFocus, aoHighlightSlideCells]
    AutoScroll = True
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HeaderSize = 22
    Options = [goDisableColumnMoving, goGrid, goHeader, goSelectFullRow]
    RowSize = 17
    ParentFont = False
    TabOrder = 1
    TabStop = True
    OnDblClick = SGSearchDblClick
    object NxTextColumn1: TNxTextColumn
      Alignment = taCenter
      DefaultValue = '0'
      Header.Caption = 'ID'
      Header.DisplayMode = dmTextAndImage
      Options = [coCanClick, coCanInput, coCanSort, coPublicUsing]
      Position = 0
      SortType = stAlphabetic
      Visible = False
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 475
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
      Position = 1
      Sorted = True
      SortType = stAlphabetic
      Width = 475
    end
  end
  object sStatusBar: TsStatusBar
    Left = 0
    Top = 436
    Width = 688
    Height = 19
    Panels = <
      item
        Width = 300
      end>
    SizeGrip = False
    SkinData.SkinSection = 'STATUSBAR'
  end
end
