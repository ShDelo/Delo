object FormDocs: TFormDocs
  Left = 367
  Top = 120
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1090#1072#1090#1100#1080
  ClientHeight = 498
  ClientWidth = 480
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
  object SGDoc: TNextGrid
    Left = 0
    Top = 0
    Width = 480
    Height = 453
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    Align = alTop
    AppearanceOptions = [aoHideFocus, aoHighlightSlideCells]
    AutoScroll = True
    Caption = ''
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HeaderSize = 25
    Options = [goDisableColumnMoving, goGrid, goHeader, goSelectFullRow]
    RowSize = 18
    ParentFont = False
    SelectionColor = 12028203
    TabOrder = 0
    TabStop = True
    OnDblClick = btnDocOpenClick
    object NxTextColumn1: TNxTextColumn
      DefaultValue = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Header.Caption = 'ID'
      Header.DisplayMode = dmTextAndImage
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Options = [coCanClick, coCanInput, coCanSort, coPublicUsing]
      ParentFont = False
      Position = 0
      SortType = stAlphabetic
      Visible = False
    end
    object NxTextColumn2: TNxTextColumn
      DefaultWidth = 460
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      Position = 1
      Sorted = True
      SortType = stAlphabetic
      Width = 460
    end
    object NxTextColumn3: TNxTextColumn
      Header.Caption = 'FileName'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Position = 2
      SortType = stAlphabetic
      Visible = False
    end
  end
  object panelAdvanced: TsPanel
    Left = 0
    Top = 453
    Width = 480
    Height = 45
    Align = alClient
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object btnClose: TsSpeedButton
      Left = 371
      Top = 8
      Width = 98
      Height = 28
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Glyph.Data = {
        AA040000424DAA04000000000000360000002800000013000000130000000100
        18000000000074040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000009E9DA97675895E5D7751516C57566C6A6A778C8C
        920000000000000000000000000000000000000000FF00000000000000000000
        0000A1A0B4605F913D3B903632A33531B7322EBA2C29A12A288434336E565672
        8C8C9400000000000000000000000020D1FF0000000000000000008080A63F3D
        9B2F2BC02721D61E18D51A13CF1712CB1712CA1B16CC231EC22A279B3B3A746F
        6F8000000000000000000092CFFF0000000000008281AD423EAD2721CB221BD4
        2C27CB3F3BC6504BC7534FC63F3CBE2925BA1A15C11C17C52924AF3C3A7F6F6F
        7F000000000000FEFEFF000000A0A0BF4743B12720D11109D32B23D7504CBD8C
        8BBDAEAEC8B3B3C7A1A1C17E7DB74744B0221EBB1914C82924AF3B3A748C8C94
        0000002AC3FF0000006462AE372FD62219D91B12D71A11D63F38CC9492CFE7E7
        F1FDFDFDF6F6F8E2E2E9A8A7C65855AE241FBE1F19CA2F2BA15857750000007C
        B1FFA2A2C25B57C52F25DF3C35D03B36C11D14D11A11D84A44D49D9BD4F2F2F8
        FFFFFFFEFEFEF0F0F4A9A8C84B48B51F19CA2D28CC3D3B7C8D8D94DDE8FF7D7C
        B17570DF4D46DE6A67C78C8BBE5853C81C13D2180FD74842D69F9ED1F5F5F8FF
        FFFFFEFEFEE2E2EA8280BB2F2AC3251ED73936996E6D7E0FD3FF6967A78580EA
        736EDD8D8BC6DDDDE8B8B7DA5752C91911D3160DD74B45D7A2A1D1F5F5F8FFFF
        FFF6F6F8A3A2C34440C41D17D53D39B25B5B749BD4FF5E5DA28F8AEF7F7BD997
        97C2FAFAFBFAFAFCBFBEDA5751C8190FD3140AD74B45D79F9ED1F2F2F8FDFDFD
        B3B3C75450C61913D1403BC35756741DD7FF6563A59691EF8682DC9997C5F3F3
        F7FFFFFFFBFBFCC0C0DA5D58C91910D3170DD74842D69D9BD4E8E7F1AEAEC750
        4DC71B14D23D38BD61617C96ECFF7877B09B96EC8F8BE59897CDDBDBE6FEFEFE
        FFFFFFFCFCFDC0C0DA5A55C92219D52219D9514CD59896D08F8DBE443FC7231D
        D73B37A877768BF4F7FF9897C09794DF9995EC9593D5B6B5D1F4F4F7FFFFFFFF
        FFFFFBFBFCC2C1DC716DCE4A43DA4841DF615BD36965C34943D2423CDC454493
        9E9EAAFAFCFF0000008D8BCBA39FF09995E39997CCC9C9DEF4F4F7FEFEFEFFFF
        FFFAFAFCC0BFDB7E7ACF635DDD635DE36A64E45F59E15B56CC68689300000064
        E5FF0000009D9BC59B97DFA39FEF9A96DF9998CCB6B6D2DBDBE6F3F3F7FAFAFB
        DEDEE89796C16C68CB6A64E5615BE46762DC5D5AA8A5A4B60000000000FF0000
        000000009594C89E9BE2A5A2EF9D9AE49A97D69C9BCE9B9BC59A9AC29997CA8E
        8CCF7F7BDB7772E8746EE26E6BBE8D8CAE00000000000094C8FF000000000000
        0000009694C89E9BE0AAA6F1A39FEE9A97E69290DE8E8ADB8C88E18A86E88984
        ED8580E47571C19291B70000000000000000009FEEFF00000000000000000000
        00009E9DC5918FCB9F9DE0A7A3EDA6A3F2A29EF29C98EE938FE48381CF807EB8
        A9A8C400000000000000000000000098EEFF0000000000000000000000000000
        000000009999C17C7BB06A69A56463A36F6DA98381B3A6A5C300000000000000
        00000000000000000000000000FF}
      OnClick = btnCloseClick
      SkinData.SkinSection = 'PAGECONTROL'
    end
    object btnDocOpen: TsSpeedButton
      Left = 243
      Top = 8
      Width = 122
      Height = 28
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1090#1072#1090#1100#1102
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000022000000330000
        0033000000330000003300000033000000330000003300000030000000000000
        00230000003300000033000000330000003300000033A2620FB9B0680DFFAE66
        09FFAE6609FFAE6609FFAE6608FFAE6508FFAF680DFFB16E18F200000000AB7F
        4EBFB88956FFB88A57FFB88955FFB68651FFB58754FFAD6404FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF680DFF00000033BC88
        4EFFFFDFAAFFBC8D58FFB5844FFFFFFAEFFFFFF9F0FFA95D00FFFFFFFFFFA85A
        00FFE9D6BEFFAB6000FFC28A42FFFFFFFFFFFFFFFFFFAD6508FF8D8D90FFC5CA
        D1FF57616EFFC6975EFFB4824BFFFFF4E7FFFDF0E3FFA85B00FFFFFFFFFFAC62
        02FFBC8133FFB06A10FFAD6305FFF2E5D5FFFFFFFFFFAD6508FF00000000BF89
        4DFFAB7A3EFFCB9F65FFB2814BFFFDF3E6FFFBECDDFFA85B00FFFFFFFFFFAD63
        05FFBC8235FFB16B12FFBA7F2FFFCFA46CFFFFFFFFFFAE660AFF00000033BD87
        4CFFFFDFA4FFD0A568FFB2804AFFFFF3E6FFFAEAD8FFA95D00FFFFFFFFFFAC62
        02FFECDCC7FFAD6406FFEBDAC3FFAB5F00FFFFFFFFFFB06A0FFF8E8D8FFFC5C9
        D1FF565F6DFFD9AE6FFFB2804AFFFDF3E7FFF9E7D3FFAA5F00FFC48E49FFAA5D
        00FFDBBC93FFB5731DFFF4EADDFFA95D00FFB36E16FFB16C13FF00000000BF88
        4DFFA67B3AFFDEB576FFB17F49FFFEF4E7FFF7E3CCFFA85C00FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB16B12FF00000033BD87
        4CFFFFE09EFFE3BB7AFFB17E49FFFEF4E9FFF5DDC2FFCCA065FFA75900FFA758
        00FFA75800FFA75900FFA75A00FFA95D00FFAE6507FFB36E15E78E8D90FFC5C9
        D1FF555D6CFFEBC47FFFB17E49FFFFF5EBFFF2D6B7FFFFFAF5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFDFBFFF6DCC1FFFFFDF7FFB58756FF0000000000000000BF88
        4DFFA57C35FFECC581FFB07E49FFFFF8EEFFF0D3B1FFF1D4B3FFF3D6B5FFF3D6
        B5FFF2D5B4FFF1D4B4FFF1D4B3FFFFFAF2FFB4844FFF0000000000000033BD87
        4CFFF9D08BFFEBC47FFFB07D48FFFFFAF2FFEFD0ADFFF1D4B2FFAB773EFFCFA6
        7AFFCDA477FFF0D2B0FFEFD0ACFFFFFBF3FFB4824CFF000000008D8D90FFC3C8
        CFFF525A67FFEBC37BFFB07D46FFFFFDF8FFEECCA6FFEFCEA9FFF0D1ACFFF0D1
        ACFFF0CFABFFEECDA8FFEECCA6FFFFFEF9FFB4834CFF0000000000000000BC86
        4BFFFFF2D4FFFEF1D4FFB27F49FFFFFFFFFFFFFEFAFFFFFEFAFFFFFFFBFFFFFF
        FBFFFFFEFAFFFFFEFAFFFFFEFAFFFFFFFFFFB5844FFF0000000000000000BA8A
        54AFB78752FFB68652FFB78752FFB5844EFFB4824CFFB4824BFFB4824BFFB482
        4BFFB4824BFFB4824BFFB4824CFFB5844FFFB88955B000000000}
      OnClick = btnDocOpenClick
      SkinData.SkinSection = 'PAGECONTROL'
    end
  end
end
