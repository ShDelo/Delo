object FormFirmInfo: TFormFirmInfo
  Left = 390
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1092#1080#1088#1084#1077
  ClientHeight = 574
  ClientWidth = 593
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
  object panelGeneral: TsPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 57
    Align = alTop
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object lblFirmName: TsLabelFX
      Left = 1
      Top = 1
      Width = 591
      Height = 58
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblFirmName'
      ParentFont = False
      WordWrap = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
  end
  object panelAdvanced: TsPanel
    Left = 0
    Top = 533
    Width = 593
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object lblID: TsLabel
      Left = 12
      Top = 16
      Width = 21
      Height = 13
      Caption = 'lblID'
      ParentFont = False
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object BtnNBAddRec: TsBitBtn
      Left = 162
      Top = 8
      Width = 117
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1085#1072#1103' '#1082#1085#1080#1075#1072
      TabOrder = 2
      OnClick = BtnNBAddRecClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 0
      Images = FormMain.ImageList1
    end
    object BtnPrint: TsBitBtn
      Left = 406
      Top = 8
      Width = 89
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = BtnPrintClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 4
      Images = FormMain.ImageList1
    end
    object BtnClose: TsBitBtn
      Left = 500
      Top = 8
      Width = 89
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = BtnCloseClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 22
      Images = FormMain.ImageList1
    end
    object BtnDocs: TsBitBtn
      Left = 46
      Top = 8
      Width = 110
      Height = 25
      Caption = #1057#1090#1072#1090#1100#1103' '#1092#1080#1088#1084#1099
      TabOrder = 3
      Visible = False
      OnClick = BtnDocsClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 8
      Images = FormMain.ImageList1
    end
    object btnSendEmail: TsBitBtn
      Left = 284
      Top = 8
      Width = 117
      Height = 25
      Caption = #1056#1072#1089#1089#1099#1083#1082#1072' '#1087#1086#1095#1090#1099
      TabOrder = 4
      OnClick = btnSendEmailClick
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 7
      Images = FormMain.ImageList1
    end
  end
  object reFirmInfo: TsRichEdit
    Left = 0
    Top = 57
    Width = 593
    Height = 476
    TabStop = False
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    Color = 13946053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      'reFirmInfo')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    OnKeyDown = reFirmInfoKeyDown
    Text = 'reFirmInfo'#13#10
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'MS Sans Serif'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'PANEL'
  end
end
