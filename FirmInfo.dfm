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
      Height = 62
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
      Angle = 0
      Shadow.Mode = smCustom
      Shadow.OffsetKeeper.LeftTop = -3
      Shadow.OffsetKeeper.RightBottom = 5
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
      Left = 4
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
      Left = 152
      Top = 8
      Width = 120
      Height = 25
      Caption = #1047#1072#1087#1080#1089#1085#1072#1103' '#1082#1085#1080#1075#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnClick = BtnNBAddRecClick
      ImageIndex = 0
      Images = FormMain.ImageList1
      ShowFocus = False
      SkinData.CustomFont = True
      SkinData.SkinSection = 'PAGECONTROL'
    end
    object BtnPrint: TsBitBtn
      Left = 405
      Top = 8
      Width = 89
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = BtnPrintClick
      ImageIndex = 4
      Images = FormMain.ImageList1
      ShowFocus = False
      SkinData.CustomFont = True
      SkinData.SkinSection = 'PAGECONTROL'
    end
    object BtnClose: TsBitBtn
      Left = 500
      Top = 8
      Width = 89
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = BtnCloseClick
      ImageIndex = 22
      Images = FormMain.ImageList1
      ShowFocus = False
      SkinData.CustomFont = True
      SkinData.SkinSection = 'PAGECONTROL'
    end
    object BtnDocs: TsBitBtn
      Left = 31
      Top = 8
      Width = 115
      Height = 25
      Caption = #1057#1090#1072#1090#1100#1103' '#1092#1080#1088#1084#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TabStop = False
      Visible = False
      OnClick = BtnDocsClick
      ImageIndex = 8
      Images = FormMain.ImageList1
      ShowFocus = False
      SkinData.CustomFont = True
      SkinData.SkinSection = 'PAGECONTROL'
    end
    object btnSendEmail: TsBitBtn
      Left = 278
      Top = 8
      Width = 122
      Height = 25
      Caption = #1056#1072#1089#1089#1099#1083#1082#1072' '#1087#1086#1095#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = btnSendEmailClick
      ImageIndex = 7
      Images = FormMain.ImageList1
      ShowFocus = False
      SkinData.CustomFont = True
      SkinData.SkinSection = 'PAGECONTROL'
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
    Color = clWhite
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
    SkinData.SkinSection = 'PANEL'
  end
end
