object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'SICOM Varejo'
  ClientHeight = 688
  ClientWidth = 1386
  Color = 14737632
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 666
    Width = 1380
    Height = 19
    Color = 14737632
    Panels = <
      item
        Width = 230
      end
      item
        Text = 'Tempo de Conex'#227'o: 00:00:00'
        Width = 200
      end
      item
        Width = 250
      end
      item
        Text = 'Desenvolvido por Sobral Info | Acesse www.sobralinfo.com.br  '
        Width = 250
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1386
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = 6710886
    ParentBackground = False
    TabOrder = 0
    object lblCaption: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 1309
      Height = 27
      Align = alClient
      Alignment = taCenter
      Caption = 'Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 64
      ExplicitHeight = 23
    end
    object Image1: TImage
      Left = 1383
      Top = 0
      Width = 3
      Height = 33
      Cursor = crHandPoint
      Align = alRight
      Center = True
      Stretch = True
      OnClick = Image1Click
      ExplicitLeft = 1382
    end
    object Image2: TImage
      Left = 1349
      Top = 0
      Width = 34
      Height = 33
      Cursor = crHandPoint
      Hint = 'Fechar'
      Align = alRight
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
        001408060000008D891D0D000000097048597300000B1300000B1301009A9C18
        0000012D4944415478DA6364A0326044E6FC07F24F79783899EFD8B19758034E
        7A78389BEDD8B18F11AC1DC9409061178382E6F2898BFB7F7CF972AAE1BA7575
        840C3BEFEFDFC02F2595FBF9D5AB2D7A6BD726800C851B08346CA18C8E4E1897
        A020C787E7CF3FBCB87D7B92E1FAF5F5380D0B0C6C945055CD13909414F8F6FE
        FD8F2757AEACD25FB72E1E6EE0A5A0A04A5165E55201292941101FE8CA0F2F81
        86EAAF5D8B61283EB58CC42A24560D2329B61363218681E8E103E283C2F4F98D
        1B172435340C90C5B08533560341E05C4040BD94BA7A1EBF84841088FFF7D72F
        06663636B0DC87172F3E820DC39212701A88CDFB84228BBE0652D5CB548D948B
        818155622A2A25544936F80CC315AE3813363186116328ED0A07728A2F504A00
        1A082ABEB662145F3043A956C0520B0000ECB15624EC252E7D0000000049454E
        44AE426082}
      ShowHint = True
      OnClick = Image1Click
      ExplicitLeft = 1352
      ExplicitHeight = 31
    end
    object Image22: TImage
      Left = 1315
      Top = 0
      Width = 34
      Height = 33
      Cursor = crHandPoint
      Hint = 'Minimizar'
      Align = alRight
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
        001408060000008D891D0D000000097048597300000B1300000B1301009A9C18
        0000004A4944415478DA6364A032601C3570D440320D0C6FDA3B838999998312
        83FEFDFDFB63659D7306D8C0F4C9E71EA8A828C95362E09D3BF71ECECC3552A0
        8D8154F73235C1A881A3069201001382201583B229360000000049454E44AE42
        6082}
      ShowHint = True
      OnClick = Image22Click
      ExplicitLeft = 1352
      ExplicitHeight = 31
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 33
    Width = 1386
    Height = 630
    Align = alClient
    BevelOuter = bvNone
    Color = 16750899
    ParentBackground = False
    TabOrder = 2
    object Image12: TImage
      AlignWithMargins = True
      Left = 340
      Top = 3
      Width = 1043
      Height = 624
      Align = alClient
      AutoSize = True
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000930000
        002408060000008D2A08D80000000467414D410000B18E7CFB51930000000662
        4B474400FF00FF00FFA0BDA793000000097048597300001EC200001EC2016ED0
        753E0000000774494D4507E6050901112CD9E2B701000014284944415478DAED
        9C09781D5515C74FF62629A550288BD286228B806805D12A4A1051360BB82B20
        1504AD8A8A1444EB524511A4858F5D760541810A68CBAE50042DADB66C02A52D
        45646B4B812E4993BCE4BD787E33E726F7DDCCBC372FA17E9FD5F37D07F266E6
        DEB9CBFF9EF33FE7DE695557A12009324CB559B55EB52AE17EAF6493BC6A4EB5
        B3AAAAAAB3B7B7B818BF87D5D4A4162E14B7AD45F5F3AA87A9EE64EDEB565DAE
        3A4FF506D53B54D7BB02D5D5D5615DA3558F531DEEF58187EE55FD635826A91D
        DA66ED4AD53BF5CF4FA8EEAFFA16D511364EBCFB45D5BFABDE6E75AE4C6A4F3E
        9F17ADC77FCD0EAA1F573D587557D5CD54199C36D56755E7581FE7D9B80EA833
        A9DD8CB1BE877AF7E492DDE2C5AFAA5EA1BA36AD0EAFDF8CF791D61E5F7EA7FA
        30EFA8D179ACF2C0C4E47C40F543D6992D2506559554263E62E87487EAEBAACF
        F162D507559F721D4B035400A483547FA23ABE447BDA5567A94E537D9A89A26E
        375056DF6E36295B0465A9FBFB499313B4636BD56FA81EADFAA632E3D0A9FA98
        EA65AABF56ED7275F7F4F4F8EF69543D46F5EBAA3B4B0CEE340198D7AB4E9718
        B492D4E6A0ED18845B2406A92FEB540F517D20AD0EC6CF0CC029AA3F4F78C514
        D519AEBC03D338D5B3540F9518401B525EB601E17DAF70A121E8C8AC59B3E4E0
        830F762B77A24DC85619EB5FA8FA4589819B04A6FB245E28BE248229B01E6F55
        BD4875BF0AFBCBA4B34897056D4136513D43F5CBAAB515D4F967D5C9AA4FF2C3
        598650EC3DA354FFA4FAF6847A7EA07A7A99F2E0E156D58F2494BF58F5AB6EDC
        00D3E6FAF7D5124F5A45E28639ABCF0BE42A6B486743BA35C085FC41E289AC44
        CED1019AA240E81D0A98BC768C55BD4EF57D83E8E74B1283E919EAF6EAACB5F7
        9E2A955B7F04407D4ECC429570CF3BAADEAFBA4D421D8CC54755DB4B58E4DD25
        06E3E884F2B7A91EA1DAEDC07482FEB850B52E4B0F6AACDB5D053486517D7595
        5A97D83ED384423674C10530BD0F9400D334D51F06E5F236387007B8CF045538
        8CAB848ED3A765FE20570A26AF0DACCC5F48EC8AD2A44775ADC41C8EE737F1DA
        C364EF2B03C1F449D55FAA36A5D4F78AF5750B49F716CCDB49F67C9A8B06C877
        A4BC6795EA01AA8F84E5BD7662352F49793FE5E08DAF3930F1A203A58C802130
        F2D89ABCDCBEA24716ACCECBAAAEF8859BD557CB8EC3AB65CF9135B297EAD8A6
        EA3ED095911319901430312177AABE3728738DC4FC628DFD66B031F9DF56FD9B
        C4047B997BF80D001344FBDA94098577603971034B25E649007C17892D3D9C04
        90EDA3FA8C570E973D5B75AF94098213CD97184CD4F5359BA3705419838F491C
        40A481E1486B7FDA8C309617A494C77AFE56E2C02049B0BA2C94A50E4CFFD21F
        DB4909A1151DDAAD8B9675C905AA2F77249B1EDAB24373B55CB75793BC534195
        2F6FA1A6AA9E9102A6ED25B6407EDB20F387BAC1B348853F6B6C501F555DDCDF
        9E018393094C9D9D9D525F0F6F8D000D79DD3FA1ED2FA89EAC7AB3986508A4DE
        DA0410BEA0BAC4BB87E5FC850C9C60083BAEEB89E0FA287BFE1309EFC1FD4EA2
        0D7E7F3DF2FC3DD5D3BDE7D748B1E564217C4ACC55211E57DCC1C67A8C3DDB65
        7D6DB6DF043D80FC410726C2D9C652338EDB3A6B49979CBEA853F20529E9E11B
        D524CD9ED024AD5BD44A4F793011254C4F01132B1230F9BE9AB612D9FDD93D97
        16C9A498FC4C60F256F50725B63CCDC1F3582448FE8DFEE441620B03532DB860
        16EC2AFBDD64137840F01C560D577AA3B7487C21C286A3B404D7B10E807D914F
        A4698745B457EACF63BDE71953A2E211F6FB05EBE792843E60D5F0046E30B1BE
        396B4BF41A89235B02AA084C7929118EE2AEE6BF9E978973DBD5ADF516016964
        5D95D4EAEFB58A9A9C653E9A6A6330ED9B0D4CC7AB5E9102A6B1D6F1B141194C
        F2B7C4B30661FEAA4464522998B83E35A1DDE467E012795726E57D7DE252152A
        6F9398D7856D2065E2DCA22458096486F5DD172AC5F2FDCA2FE74562A44B3EE4
        3D4F1D4466BBBBA64A6CD9AE0DFACF4BAFB27B4EC87391FFFAB0772DF22EB411
        30959C72C072E6E22E99FA44671F90B836795C831CB55D9D926F2528ED05B94B
        79145C6A55AE20B74D68CE629968F167556F4C0113D68095B86F508E154CAAE0
        3CF1B8911BF8BABAE4386210606A90D882847C12AB440474BF3F7949427B7C31
        50D067F24E61C11FABFE309A94C02A79C0A42DB8DD90BF9D2F71FE2B04D368EB
        EFAEDEB3585438DC24EF1A40C47A153CAB481E0D17B7933DC36C7E49F5FD125B
        232757E8F3C747E5144CACF0D43434D59EF858875CBA2CD7C7C25B9417DDFBFE
        666969AC16E7F500CE53EB0A72FDF339F9F89BEA22325E863331D29F519D19CD
        5C327924523927A53C26177278BD76E629DF3A95B01495808989982303D3127D
        114C5A7E26B1B3FD1686DCCE8F12C6E2D312679407B4DF4B72920F04C46F0ECA
        1785E85E7F77B5FE3AAA40B4C942204D70B557FE69EBD38BDE3502889B24E67E
        C80A89736C806E8AF7DC3D56675759CEA451BF9CFC78A79CBFB4ABCF326DAAEE
        ED5A25D9876E155B1F378DB8447E03A2DA6CD1DC57C4C2CE143031E910CC034A
        D4F1BCC4E6F7724921DF5E9D9580292D3F836580B0F694B24AA1787D22D13739
        B84D9A04D731B74C369B9C20D6224C40CEB3315A47F9050B16C8F8F1D0A20820
        448DCE92E142E14710E739D29F08860741EE67797562ED4EF47EDF2DB11BC602
        4EF7AE132C00B25700D36AFD63D3B4410014573D9793131EEE284A4E6EAFE1FF
        C93B36C827D50A6D515F15016810C94B40709418FF49011466F60229F6D34942
        B44436F9D7929077190498F6B0891B153C7B955A98E3FCAD9A2C62FB64ECEBE1
        528E0E6EBF26F1243F5A064CA41DEE9281E912A24026F4B580F36145AEF49E73
        0954162081859FD586367CD3FE26DD82C5798777FF3489772DC2540316AB5575
        116062A33475AB02CBF4AFF50599F8D07A79624DBE28ED5DA3FD7EDFA85AF9DA
        B87A3970AB3A69AA912CE9005FE01FF8E1DFB80B0D03F33CC896D6D1E3A4F4B6
        0AA9839F5AA78B00350830B1FA01D3E6C1B390EFE3FDBAB3481930B1E90A981E
        2B03267824600A33F18F4B0CA65729EFB9545202DFF39E63FBA555E28428E0F8
        99778F6D28AC9B033656CA253A49271045CF9598CC73CF593BC61C8B755FA63C
        1380BAE9C56EF9CA231DB23A571CD101AA46355F1FDDBA56A6A8A51AAF5CA9B7
        322B45683A49E20827922440D944B0F30DF8E007A352EA5B6FF5DD14B57DF060
        223531470682977AE17A8541BAB94B25CE33F9B2D626727E19308D94F824C29E
        C16D4E2930C96B82688CB0FE28EF39522A07D918B1734052D8A50870B5E4F0EE
        978151EC4312937F4095B4C818EF5F012632B3E3CA0D06E0F8ED0BDDF2FD273B
        E579B55403724DFAC05825E63FD8A5413EFBE6FAC83D5600A8C5D6A0B9ED6D6D
        D2D8D4A4008DF73DDBDBDBA5B1B188D2C178F7961854874BB28B063010C8B621
        80695B1BD8B704CFC24F70B96B2B0153096B81408C4970CE766D08C5DAB49DB5
        69FBE0F6DDD6DF2EAFFD581576373EE03D47B0C34280F0034CC0F46EEF3E5B57
        F021ACDF3EDE754E0C7CDBFE1E636D68F1EE13504C034C4B12062C51E822DB28
        33948CCF5EDE231D3D03AD54B3A2E88CDD86C997B7AFCF52A52F1C4B61152D64
        301C981226C3090FB01A31D5EF08EAC254433E1F190298980CCE2485A9095C12
        605AE89ECF229E659A24C5919413367CCF4EAAD32BCB040390E141D9CB756C4E
        703CCE9E27709823FDA13DC25E9E4FAA01C929DE6F40344D6237E68EE9908A39
        DCEE21E499F022E3BD72B8EE2F64B64C4E88D8D62BAEEF5CD12DE73D9393BFBE
        DA536C81F4C756C3AAE496F734CBDE9B65DA527182BB65F373BE035398F82344
        8E0E611583AA55E2086BA4778D958E2BBC6D08604220A55F4F682BBCACCFBA64
        385CE6CBBB24B6242383EB84F7EC8175F97562999BD4525BEAE3BBF6EE50387D
        7171D0FEA400224A307ABF71796C0739FEC3213C804EFAC2AD66A23516E60AFB
        4DFE0DF2EE0744D1E903C0C4A1B53152813095806A4557AF5CF26C4ECE534BB5
        D6CF50EA9FA7ECD41059A88C2708C86F90519EED26C18BECAA4CFB0ED305297F
        7CF71C8933CB4E20DF00F3D62182891549C4199A59A222D2037F711752365911
        B2A8E485FE198F4CE496B12E13823A89AA8FB0BE44FDCCE572D2D0D0E0EE7330
        0F4B393E288715866F2D74FB71D61680726BD076A2BBABBDC424D60B2BE37269
        A40C20E9EFF2CA5CAECF9FE02D60FE08838845B401303191DB969AE96AAB2704
        06D7B976F1B29C9CF6448774B931D46B072921BF69EF66A92BEF0520E000E936
        7FF4BD0E734C97FDAD9F5B6743196B13D0E25DEB8B30060326CFA56E6913BF67
        C27B495E92279B5BA26F581FA2D066EDCF29DE8484919493BB6D925606D7B112
        58A45313CA306EE4883A8385101E1D2197C4E2B82320E944A76EEF8E19CE4BBF
        55E26F52013704EF3C2B680BD1E141806965C2E0F6096F5BDC568840C18900DE
        E6830A402DEFEC950F3ED8264BD615FAB2E4FB8DAE955BDFDD2CC34A2788D75A
        477EE72ED4146FDEEE66F7F0FBAC064CB4BFFB4EA731FD10471FB6B84C42E565
        830153348AFD8022C178A124EF5FB210710B58542C3CFC82B540C619CB030784
        739150F5233876E301E98E0975FEDEFAF9A44D260B9D6003AE136EA374D93B66
        BAB67B600A279C480C8EF9F7E0394E2910F525CDD43F254E133C1B6C3EB340CE
        F59E63F11E099820949B4B8A10955DF95C4ECE5D9A9363C7D6C9C46DEA644C63
        75B427174D92EAAC977BE4D885EB6575B7A14CFFC7960A59F232E79A207AF004
        384EE4DA02ABC0441DE23DBFD426EE519B5C004314141EFC6225B1C2BB070B26
        6FB0B12E64E1C333D4BE3051E4EB08B91BAC7E08ACEBFD6506085F4EB409499A
        44E68408176BD2220337BB9D00A263ECBD3E98A8939DFC4F79CF161DD2F3C699
        E00B6E95941E220D02D8A26CBFB7ADF369ABDF2D3026FED44C19F0992F75CB67
        E6AF8F4A8C53EB04B1DE65931A69D4262F55AB4564F772A7C713F4C133771F16
        E59DCA1070566094CF68186811D810BD564AEC1BA608FDC1ECFFC90D3032C463
        BB7BD8E0ED56615B9C8496092122E38CD29183AC139E022FFC47423F39AF44F4
        E5F3329E63F1AD0A9EC592B2F88E4878C7646B63587FABC4FCCDCFD95C0E9858
        5523244500D33D2B7BE4F079EDD289D14D0247901E1837BC5AFEA0D1DCCE9B54
        9723E07DE1700298B096A7DB24643D6C8F859BA67AA618611F2A983CF3FE1E89
        23A6F152B9F46D55042E665BABF3B00AEBC3D5C389EE75ED0BFA99948FE237D6
        757D82F5E500DF05C13BA03FB8C5C713C671771B47FF2B9F39652D136E6ADEEB
        7939F02FEDB2AEDC0125BD3DA2AE4ACEDD63981CBD5D7D96A4252715CF292880
        1AEDE848C267401C99E00C4F4B99BA208100930DCAA2F03A1804B2C09B0565FB
        2C64994F9DE03A24EFB00861689F2470C25BACFEC5AEFEA04E26844505771C55
        A63EDC1E241D8EB8D05D4CE827D11893ED1FEA837BE2F60A09606281DC1BF489
        4C3B89D08E84FA894E397FE5BBDF1701D3AA529D80602F515776D843EDD1FF53
        11A2CFEDAC1669EACEC3A2CDDFEAD25CC94904A6F03C53428292D0153F4D08CC
        6A1B1EBF31020D9F4EF1EDD735BA4AE7F1454A38C0C120001A2CB1FF1126B996
        9949E5824147B092648D898C48228EB1F6E08EB1DD6C4B10A112E5119AFFD540
        5034F1419D5CDCDB269BF342589626BB4E1F59280F1B20705FEBC2FA82B6E296
        BF25FD169DB601C2ABC3325E82F63B122F9682BD9740E086B6B63619316244F8
        3C20FDAECD85EB482ED3DE1C0669D1BA7C74E2F2E1D57979A6BD20AB72BDD25D
        9088378D69AA967D46D5CAA15BD7469C2A636E09890EB337644FFAC105C88D6C
        6E1D6650972B885639106500441ACC7B4B9D4F4A0038C2288FB6F6605A010D96
        9E04DFDACCA3502C7809F603B19E800170AE34CD67ACA3E45768257262016129
        F9FC80C1004C98CBB23C00774769087547810F0C7AA3BFD5AB455B287CEA14A6
        0DCA084F12715DD750624BE2A4934E9219336664ABB0041852B2D125073A4902
        379C2684F0582B8045D21077CD57CD05EF3E0B03BE9AF378191682550F685828
        DD5E9DD403D0AAECFE6AE907170D027C58B136AF0CF56139496CAE0CF9559671
        29E3F68B043061FA26651A69BFA0F7F7203FC264B0384F33B7A1FCE4FCD7880D
        36E90C363F091E20B1445584F0CE5A91EC243580CBBDD92BCE111B4E3162E170
        DF242A1FB07BAD12F341560B6E9473DF2FD93D7788109EE33EE3065C10FFFDEC
        39DEC7E753151D9DA94400D321D6904D875A5985021186E0ADD908C1C4792392
        92040FE4D1B036702C77449AF1E6480707F6FD0F04E02D90710836792900C591
        D80EE93F463BDDC60E90B97FA403D70F47BBD9AB0F8EC97197A956D70289497E
        EF860413E6931500191ECC67CA831108252B2BDA42D908C1E48E6990AC241C67
        0FEF347BC47D8089F5010C51C464F778060B0209275D41F4C911125C1AA0E210
        21F93780EA276AB6B17710399E6CD7C88073DC6482FD4D5AA4552A3C3A5389B8
        7FB802FF8E49C61493116D1A4AA52942C731F37C753B5D07FD2ED7A98D104C58
        22CE0A712283309DC9BCC61E215FC5D162223DF24BECBE3F6BF7483BB0634F58
        CF7E20609C6663079866DAB36CB5E02A975BB92430B1E746C69B23BE7CF94224
        8CC55CB1A1C1E484C88430BC45E20885AD81A1BE99816015128D3C6D03D14712
        372620218089C84F0301B8287B6FF09949D2BF218CCB81177184050E441072B7
        DDC33201282C370B0F4EF9AADD034C64AA715D00E74E6F1C93C044D6BD55FAC1
        046801D3F20D0626FED39531D279A365630312E2453B8002EB011870652FD887
        986C4FE0AA70838005509D6D654EB3326C237DD1CACDB37BCECD71B4760E17BC
        0F3B399EE2389303138952FE7134C0C409053E7B6A153BDABB21E43FC591FE67
        C403132E8CCFC75DA0012F222FC5571FA40AC82043CA21D2808B821070B63600
        C19556DEEDFC4FB4DF5C073824158988F737A59CFB9842ACEE5F4A6CA1D877FB
        A3026FB2FFCF0CBDD1F27F306D00314071580F8E334B27708A59901689AD0751
        1CC75AE044907532DFB8354E4C1271B1518D9562BB82A88C7C149C0760403DF8
        5489D312A408B040008E8D5F40F9B83503E05E627573241A3E5CF40FA0BDD1F2
        6F899CF20F8A411A7000000021744558744372656174696F6E2054696D650032
        3032323A30353A30382032313A32393A34306BB1292600000025744558746461
        74653A63726561746500323032322D30352D30395430313A31373A33392B3030
        3A303024EE731A0000002574455874646174653A6D6F6469667900323032322D
        30352D30395430313A31373A33392B30303A303055B3CBA60000000049454E44
        AE426082}
      ExplicitWidth = 147
      ExplicitHeight = 36
    end
    object Panel1: TCategoryPanelGroup
      Left = 0
      Top = 0
      Width = 337
      Height = 630
      VertScrollBar.Tracking = True
      BevelInner = bvNone
      BevelOuter = bvNone
      ChevronColor = clNavy
      ChevronHotColor = clBlack
      Color = 16750899
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientBaseColor = 16750899
      GradientColor = 16750899
      GradientDirection = gdHorizontal
      HeaderAlignment = taCenter
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWhite
      HeaderFont.Height = -13
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = [fsBold]
      HeaderStyle = hsImage
      ParentFont = False
      TabOrder = 0
      object CategoryPanel6: TCategoryPanel
        Top = 150
        Height = 30
        Caption = 'Configura'#231#245'es'
        Color = 16750899
        Collapsed = True
        TabOrder = 0
        ExpandedHeight = 63
        object SpeedButton14: TSpeedButton
          Left = 0
          Top = 0
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Par'#226'metros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton14Click
          ExplicitTop = 1
        end
        object Image17: TImage
          Left = 13
          Top = 7
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
      end
      object CategoryPanel5: TCategoryPanel
        Top = 120
        Height = 30
        Caption = 'Relat'#243'rios'
        Color = 16750899
        Collapsed = True
        TabOrder = 1
        ExpandedHeight = 192
        object SpeedButton22: TSpeedButton
          Left = 0
          Top = 132
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Exportar XML'#39's NFCe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton22Click
          ExplicitTop = 123
        end
        object SpeedButton21: TSpeedButton
          Left = 0
          Top = 33
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Recebimentos por Forma de PG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton21Click
          ExplicitTop = 18
        end
        object SpeedButton20: TSpeedButton
          Left = 0
          Top = 99
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Estoque Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton20Click
          ExplicitTop = 82
          ExplicitWidth = 314
        end
        object SpeedButton12: TSpeedButton
          Left = 0
          Top = 66
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Produtos Mais Vendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton12Click
          ExplicitTop = 8
          ExplicitWidth = 314
        end
        object SpeedButton13: TSpeedButton
          Left = 0
          Top = 0
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Vendas por Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton13Click
          ExplicitTop = 8
          ExplicitWidth = 314
        end
        object Image15: TImage
          Left = 13
          Top = 7
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image16: TImage
          Left = 13
          Top = 39
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image24: TImage
          Left = 13
          Top = 70
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image25: TImage
          Left = 13
          Top = 105
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object SpeedButton23: TSpeedButton
          Left = 0
          Top = 165
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Controle Fiado por Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          OnClick = SpeedButton22Click
          ExplicitTop = 140
        end
        object Image26: TImage
          Left = 13
          Top = 138
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
      end
      object CategoryPanel3: TCategoryPanel
        Top = 90
        Height = 30
        Caption = 'Vendas'
        Color = 16750899
        Collapsed = True
        TabOrder = 2
        ExpandedHeight = 63
        object SpeedButton11: TSpeedButton
          Left = 0
          Top = 0
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'PDV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton11Click
          ExplicitTop = 8
          ExplicitWidth = 314
        end
        object Image14: TImage
          Left = 13
          Top = 6
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
      end
      object CategoryPanel4: TCategoryPanel
        Top = 60
        Height = 30
        Caption = 'Financeiro'
        Color = 16750899
        Collapsed = True
        TabOrder = 3
        ExpandedHeight = 127
        object SpeedButton24: TSpeedButton
          Left = 0
          Top = 66
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Lan'#231'amentos Financeiros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton24Click
          ExplicitTop = 48
        end
        object SpeedButton8: TSpeedButton
          Left = 0
          Top = 0
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Fiado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton8Click
          ExplicitTop = 8
          ExplicitWidth = 314
        end
        object Image11: TImage
          Left = 13
          Top = 5
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object SpeedButton25: TSpeedButton
          Left = 0
          Top = 33
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Contas Financeiras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton25Click
          ExplicitTop = 41
        end
      end
      object CategoryPanel2: TCategoryPanel
        Top = 30
        Height = 30
        Caption = 'Produtos / Estoque'
        Color = 16750899
        Collapsed = True
        TabOrder = 4
        ExpandedHeight = 195
        object SpeedButton15: TSpeedButton
          Left = 0
          Top = 66
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Promo'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton15Click
          ExplicitTop = 67
          ExplicitWidth = 314
        end
        object SpeedButton10: TSpeedButton
          Left = 0
          Top = 132
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Importa'#231#227'o de XML'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton10Click
          ExplicitTop = 74
          ExplicitWidth = 314
        end
        object SpeedButton9: TSpeedButton
          Left = 0
          Top = 33
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Unidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton9Click
          ExplicitTop = 34
          ExplicitWidth = 314
        end
        object SpeedButton6: TSpeedButton
          Left = 0
          Top = 0
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton6Click
          ExplicitTop = 8
          ExplicitWidth = 314
        end
        object SpeedButton7: TSpeedButton
          Left = 0
          Top = 99
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Entrada Manual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton7Click
          ExplicitLeft = 14
          ExplicitTop = 84
          ExplicitWidth = 314
        end
        object Image8: TImage
          Left = 13
          Top = 39
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image9: TImage
          Left = 13
          Top = 6
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image10: TImage
          Left = 13
          Top = 137
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image13: TImage
          Left = 13
          Top = 106
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image18: TImage
          Left = 13
          Top = 72
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
      end
      object CategoryPanel1: TCategoryPanel
        Top = 0
        Height = 30
        Cursor = crHandPoint
        Caption = 'Cadastros'
        Color = 16750899
        Collapsed = True
        TabOrder = 5
        ExpandedHeight = 325
        object SpeedButton19: TSpeedButton
          Left = 0
          Top = 231
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Kit Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton19Click
          ExplicitLeft = -1
          ExplicitWidth = 314
        end
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 264
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Caixas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton1Click
          ExplicitTop = 263
          ExplicitWidth = 314
        end
        object SpeedButton18: TSpeedButton
          Left = 0
          Top = 198
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Categoria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton18Click
          ExplicitTop = 204
          ExplicitWidth = 314
        end
        object SpeedButton17: TSpeedButton
          Left = 0
          Top = 165
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Fornecedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton17Click
          ExplicitLeft = 38
          ExplicitTop = 15
          ExplicitWidth = 253
        end
        object SpeedButton16: TSpeedButton
          Left = 0
          Top = 132
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Formas de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton16Click
          ExplicitTop = 140
          ExplicitWidth = 314
        end
        object SpeedButton2: TSpeedButton
          Left = 0
          Top = 99
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Usu'#225'rios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton2Click
          ExplicitTop = 8
          ExplicitWidth = 314
        end
        object SpeedButton3: TSpeedButton
          Left = 0
          Top = 66
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Funcion'#225'rios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton3Click
          ExplicitTop = 8
          ExplicitWidth = 314
        end
        object SpeedButton4: TSpeedButton
          Left = 0
          Top = 33
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton4Click
          ExplicitTop = 42
          ExplicitWidth = 314
        end
        object SpeedButton5: TSpeedButton
          Left = 0
          Top = 0
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton5Click
          ExplicitTop = 5
          ExplicitWidth = 308
        end
        object Image3: TImage
          Left = 13
          Top = 6
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image4: TImage
          Left = 13
          Top = 38
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image5: TImage
          Left = 13
          Top = 72
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image6: TImage
          Left = 13
          Top = 105
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image7: TImage
          Left = 13
          Top = 138
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image19: TImage
          Left = 13
          Top = 171
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
          OnClick = Image19Click
        end
        object Image20: TImage
          Left = 13
          Top = 236
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
          OnClick = Image19Click
        end
        object Image21: TImage
          Left = 13
          Top = 203
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
          OnClick = Image19Click
        end
        object Image23: TImage
          Left = 13
          Top = 267
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
          OnClick = Image19Click
        end
      end
    end
    object Button1: TButton
      Left = 448
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      Visible = False
      OnClick = Button1Click
    end
  end
  object HTTPBasicAuthenticator1: THTTPBasicAuthenticator
    Username = 'Sobral@Info250415'
    Password = 'Super@2504_'
    Left = 696
    Top = 128
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse1
    ConnectTimeout = 1000000000
    ReadTimeout = 1000000000
    SynchronizedEvents = False
    Left = 688
    Top = 126
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'text/html'
    Left = 576
    Top = 126
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Users\sobra\OneDrive\Pedido (OnLine)\DB\PEDIDO.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 576
    Top = 208
  end
  object qryProdutos: TFDQuery
    Connection = ConexaoLocal
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 100000000
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select p.id,'
      '       p.status,'
      '       p.descricao,'
      '       p.qtde_estoque,'
      '       p.referencia,'
      '       p.id_unidade,'
      '       p.codigo_barras,'
      '       p.valor_unitario,'
      '       p.imprimir_cozinha,'
      '       p.id_categoria,'
      '       p.estoque_minimo,'
      '       p.NCM,'
      '       p.CEST,'
      '       p.TAXA_PIS,'
      '       p.TAXA_COFINS,'
      '       p.TAXA_ICMS,'
      '       p.CST_CSOSN,'
      '       p.CST_PIS,'
      '       p.CST_COFINS,'
      '       p.ORIGEM,'
      '       p.CFOP,'
      '       p.FISCAL,'
      '       u.sigla as unidade,'
      '       u.fator,        '
      '       '#39'N'#39' AS kit'
      '  from produtos p,'
      '       unidade_produtos u'
      ' WHERE p.id_unidade = u.id'
      ' UNION'
      'select -1 AS id,'
      '       k.status,'
      '       k.descricao,'
      '       0.00 AS qtde_estoque,'
      '       '#39#39' AS referencia,'
      '       1 AS id_unidade,'
      '       k.gtin AS codigo_barras,'
      '       K.valor AS valor_unitario,'
      '       '#39'N'#39' AS imprimir_cozinha,'
      '       1 AS id_categoria,'
      '       0.00 as estoque_minimo,'
      '       '#39#39' NCM,'
      '       '#39#39' CEST,'
      '       0.00 TAXA_PIS,'
      '       0.00 TAXA_COFINS,'
      '       0.00 TAXA_ICMS,'
      '       '#39#39' CST_CSOSN,'
      '       '#39#39' CST_PIS,'
      '       '#39#39' CST_COFINS,'
      '       0 ORIGEM,'
      '       '#39#39' CFOP,'
      '       '#39#39' FISCAL,'
      '       '#39'UND'#39' as unidade,'
      '       1 AS fator,'
      '       '#39'S'#39' AS kit'
      '  from kit_produto_cabecalho k')
    Left = 584
    Top = 280
    object qryProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 120
    end
    object qryProdutosQTDE_ESTOQUE: TFloatField
      FieldName = 'QTDE_ESTOQUE'
      Origin = 'QTDE_ESTOQUE'
      DisplayFormat = '#0.000'
    end
    object qryProdutosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 80
    end
    object qryProdutosID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Origin = 'ID_UNIDADE'
    end
    object qryProdutosCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
      FixedChar = True
      Size = 15
    end
    object qryProdutosVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      DisplayFormat = '###,#0.00'
    end
    object qryProdutosUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryProdutosFATOR: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'FATOR'
      Origin = 'FATOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryProdutosIMPRIMIR_COZINHA: TStringField
      FieldName = 'IMPRIMIR_COZINHA'
      Origin = 'IMPRIMIR_COZINHA'
      FixedChar = True
      Size = 1
    end
    object qryProdutosID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object qryProdutosKIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'KIT'
      Origin = 'KIT'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryProdutosESTOQUE_MINIMO: TFloatField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = 'ESTOQUE_MINIMO'
    end
    object qryProdutosNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 8
    end
    object qryProdutosCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 7
    end
    object qryProdutosTAXA_PIS: TFloatField
      FieldName = 'TAXA_PIS'
      Origin = 'TAXA_PIS'
    end
    object qryProdutosTAXA_COFINS: TFloatField
      FieldName = 'TAXA_COFINS'
      Origin = 'TAXA_COFINS'
    end
    object qryProdutosTAXA_ICMS: TFloatField
      FieldName = 'TAXA_ICMS'
      Origin = 'TAXA_ICMS'
    end
    object qryProdutosCST_CSOSN: TStringField
      FieldName = 'CST_CSOSN'
      Origin = 'CST_CSOSN'
      Size = 3
    end
    object qryProdutosCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      FixedChar = True
      Size = 2
    end
    object qryProdutosCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      FixedChar = True
      Size = 2
    end
    object qryProdutosORIGEM: TIntegerField
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
    end
    object qryProdutosCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      FixedChar = True
      Size = 4
    end
    object qryProdutosFISCAL: TStringField
      FieldName = 'FISCAL'
      Origin = 'FISCAL'
      FixedChar = True
      Size = 1
    end
  end
  object dtsClientes: TDataSource
    DataSet = qryClientes
    Left = 656
    Top = 336
  end
  object qryClientes: TFDQuery
    OnCalcFields = qryClientesCalcFields
    Connection = ConexaoLocal
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 100000000
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from clientes')
    Left = 656
    Top = 280
    object qryClientesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 14
    end
    object qryClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryClientesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 120
    end
    object qryClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 30
    end
    object qryClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 120
    end
    object qryClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 120
    end
    object qryClientesCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
    end
    object qryClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 11
    end
    object qryClientesFONE_FIXO: TStringField
      FieldName = 'FONE_FIXO'
      Origin = 'FONE_FIXO'
      Size = 10
    end
    object qryClientesREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 250
    end
    object qryClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      EditMask = '(99)99999.9999;0;_'
      FixedChar = True
      Size = 11
    end
    object qryClientescalcCPFCNPJ: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCPFCNPJ'
      Calculated = True
    end
    object qryClientesDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 576
    Top = 336
  end
  object qryFuncionarios: TFDQuery
    Connection = ConexaoLocal
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 250
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from FUNCIONARIOS')
    Left = 504
    Top = 280
    object qryFuncionariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFuncionariosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFuncionariosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 30
    end
    object qryFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 120
    end
    object qryFuncionariosPERCENTUAL_COMISSAO: TFloatField
      FieldName = 'PERCENTUAL_COMISSAO'
      Origin = 'PERCENTUAL_COMISSAO'
    end
  end
  object dtsFuncionarios: TDataSource
    DataSet = qryFuncionarios
    Left = 496
    Top = 336
  end
  object dtsFormaPG: TDataSource
    DataSet = qryFormaPG
    Left = 736
    Top = 336
  end
  object qryFormaPG: TFDQuery
    OnCalcFields = qryFormaPGCalcFields
    Connection = ConexaoLocal
    FetchOptions.AssignedValues = [evRowsetSize]
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select id,'
      '       status,'
      '       nome,'
      '       id_original,'
      '       permite_troco,'
      '       PRAZO_PARCELAS,'
      '       GERAR_FINANCEIRO, '
      '       FIDELIDADE,'
      '       EMITIR_FISCAL,'
      '       TIPO_PG_NFCE from formas_pagamento'
      'WHERE STATUS = '#39'A'#39
      ' UNION'
      ' SELECT 0 AS ID,'
      '        '#39'A'#39' status,'
      '        '#39'FIADO'#39' AS nome,'
      '        null id_original,'
      '        '#39'N'#39' AS permite_troco,'
      '        0  PRAZO_PARCELAS,'
      '        '#39'N'#39' GERAR_FINANCEIRO,'
      '        NULL AS FIDELIDADE,'
      '        '#39#39' EMITIR_FISCAL,'
      '        0 TIPO_PG_NFCE FROM configuracoes'
      ' ORDER BY 3')
    Left = 728
    Top = 280
    object qryFormaPGID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFormaPGSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFormaPGNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 120
    end
    object qryFormaPGID_ORIGINAL: TIntegerField
      FieldName = 'ID_ORIGINAL'
      Origin = 'ID_ORIGINAL'
    end
    object qryFormaPGPERMITE_TROCO: TStringField
      FieldName = 'PERMITE_TROCO'
      Origin = 'PERMITE_TROCO'
      FixedChar = True
      Size = 1
    end
    object qryFormaPGcalcStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcStatus'
      Size = 10
      Calculated = True
    end
    object qryFormaPGFIDELIDADE: TStringField
      FieldName = 'FIDELIDADE'
      Origin = 'FIDELIDADE'
      FixedChar = True
      Size = 1
    end
    object qryFormaPGEMITIR_FISCAL: TStringField
      FieldName = 'EMITIR_FISCAL'
      Origin = 'EMITIR_FISCAL'
      FixedChar = True
      Size = 1
    end
    object qryFormaPGTIPO_PG_NFCE: TIntegerField
      FieldName = 'TIPO_PG_NFCE'
      Origin = 'TIPO_PG_NFCE'
    end
    object qryFormaPGPRAZO_PARCELAS: TIntegerField
      FieldName = 'PRAZO_PARCELAS'
      Origin = 'PRAZO_PARCELAS'
    end
    object qryFormaPGGERAR_FINANCEIRO: TStringField
      FieldName = 'GERAR_FINANCEIRO'
      Origin = 'GERAR_FINANCEIRO'
      FixedChar = True
      Size = 1
    end
  end
  object RESTClient1: TRESTClient
    Authenticator = HTTPBasicAuthenticator1
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://54.71.95.15:8080/datasnap/rest/TSM/Clientes'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 496
    Top = 128
  end
  object dtsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 800
    Top = 336
  end
  object qryEmpresa: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from empresa ORDER BY fantasia')
    Left = 800
    Top = 280
    object qryEmpresaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object qryEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 120
    end
    object qryEmpresaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 100
    end
    object qryEmpresaFONE: TStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      FixedChar = True
      Size = 10
    end
    object qryEmpresaCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      FixedChar = True
      Size = 11
    end
    object qryEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryEmpresaSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      Size = 100
    end
    object qryEmpresaBASE_LOCAL: TStringField
      FieldName = 'BASE_LOCAL'
      Origin = 'BASE_LOCAL'
      FixedChar = True
      Size = 1
    end
    object qryEmpresaULTIMO_NSU: TIntegerField
      FieldName = 'ULTIMO_NSU'
      Origin = 'ULTIMO_NSU'
    end
    object qryEmpresaCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Origin = 'CODIGO_UF'
    end
    object qryEmpresaDATA_HORA_BLOQUEIO_XML: TSQLTimeStampField
      FieldName = 'DATA_HORA_BLOQUEIO_XML'
      Origin = 'DATA_HORA_BLOQUEIO_XML'
    end
    object qryEmpresaID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
      Origin = 'ID_MUNICIPIO'
    end
    object qryEmpresaCODIGO_CIDADE: TIntegerField
      FieldName = 'CODIGO_CIDADE'
      Origin = 'CODIGO_CIDADE'
    end
    object qryEmpresaIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object qryEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryEmpresaLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 80
    end
    object qryEmpresaNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryEmpresaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryEmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 80
    end
    object qryEmpresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 80
    end
    object qryEmpresaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object qryEmpresaTIPO_REGIME: TIntegerField
      FieldName = 'TIPO_REGIME'
      Origin = 'TIPO_REGIME'
    end
  end
  object dtsUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 872
    Top = 336
  end
  object qryUsuarios: TFDQuery
    OnCalcFields = qryUsuariosCalcFields
    Connection = ConexaoLocal
    FetchOptions.AssignedValues = [evRowsetSize]
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from usuarios ORDER BY nome')
    Left = 872
    Top = 280
    object qryUsuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsuariosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 30
    end
    object qryUsuariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 120
    end
    object qryUsuariosPW: TStringField
      FieldName = 'PW'
      Origin = 'PW'
      Size = 120
    end
    object qryUsuariosCPF: TStringField
      FieldName = 'CPF'
      LookupDataSet = qryClientes
      Origin = 'CPF'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 11
    end
    object qryUsuarioscalcUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUsuario'
      Size = 10
      Calculated = True
    end
    object qryUsuariosFILTRO_CADASTRO_EMPRESA: TStringField
      FieldName = 'FILTRO_CADASTRO_EMPRESA'
      Origin = 'FILTRO_CADASTRO_EMPRESA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_USUARIOS: TStringField
      FieldName = 'FILTRO_CADASTRO_USUARIOS'
      Origin = 'FILTRO_CADASTRO_USUARIOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_FUNCIONARIOS: TStringField
      FieldName = 'FILTRO_CADASTRO_FUNCIONARIOS'
      Origin = 'FILTRO_CADASTRO_FUNCIONARIOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_CLIENTES: TStringField
      FieldName = 'FILTRO_CADASTRO_CLIENTES'
      Origin = 'FILTRO_CADASTRO_CLIENTES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_UNIDADES: TStringField
      FieldName = 'FILTRO_CADASTRO_UNIDADES'
      Origin = 'FILTRO_CADASTRO_UNIDADES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_PRODUTOS: TStringField
      FieldName = 'FILTRO_CADASTRO_PRODUTOS'
      Origin = 'FILTRO_CADASTRO_PRODUTOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_PAGAMENTOS: TStringField
      FieldName = 'FILTRO_CADASTRO_PAGAMENTOS'
      Origin = 'FILTRO_CADASTRO_PAGAMENTOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_VENDAS: TStringField
      FieldName = 'FILTRO_ACESSO_VENDAS'
      Origin = 'FILTRO_ACESSO_VENDAS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_EXPORTACOES: TStringField
      FieldName = 'FILTRO_ACESSO_EXPORTACOES'
      Origin = 'FILTRO_ACESSO_EXPORTACOES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_RELATORIOS: TStringField
      FieldName = 'FILTRO_ACESSO_RELATORIOS'
      Origin = 'FILTRO_ACESSO_RELATORIOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_CONFIGURACOES: TStringField
      FieldName = 'FILTRO_ACESSO_CONFIGURACOES'
      Origin = 'FILTRO_ACESSO_CONFIGURACOES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_PED_ATIVOS: TStringField
      FieldName = 'FILTRO_ACESSO_PED_ATIVOS'
      Origin = 'FILTRO_ACESSO_PED_ATIVOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_PED_CANCELADOS: TStringField
      FieldName = 'FILTRO_ACESSO_PED_CANCELADOS'
      Origin = 'FILTRO_ACESSO_PED_CANCELADOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_CANC_VENDA: TStringField
      FieldName = 'FILTRO_ACESSO_CANC_VENDA'
      Origin = 'FILTRO_ACESSO_CANC_VENDA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_CANC_PEDIDO: TStringField
      FieldName = 'FILTRO_ACESSO_CANC_PEDIDO'
      Origin = 'FILTRO_ACESSO_CANC_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_GERAR_PEDIDO: TStringField
      FieldName = 'FILTRO_GERAR_PEDIDO'
      Origin = 'FILTRO_GERAR_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_FECHAMENTO: TStringField
      FieldName = 'FILTRO_ACESSO_FECHAMENTO'
      Origin = 'FILTRO_ACESSO_FECHAMENTO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_FORNECEDORES: TStringField
      FieldName = 'CADASTRO_FORNECEDORES'
      Origin = 'CADASTRO_FORNECEDORES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_CATEGORIA: TStringField
      FieldName = 'CADASTRO_CATEGORIA'
      Origin = 'CADASTRO_CATEGORIA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_KIT_PRODUTOS: TStringField
      FieldName = 'CADASTRO_KIT_PRODUTOS'
      Origin = 'CADASTRO_KIT_PRODUTOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_CAIXAS: TStringField
      FieldName = 'CADASTRO_CAIXAS'
      Origin = 'CADASTRO_CAIXAS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_PROMOCOES: TStringField
      FieldName = 'CADASTRO_PROMOCOES'
      Origin = 'CADASTRO_PROMOCOES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosENTRADA_MANUAL: TStringField
      FieldName = 'ENTRADA_MANUAL'
      Origin = 'ENTRADA_MANUAL'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosIMPORTACAO_DE_XML: TStringField
      FieldName = 'IMPORTACAO_DE_XML'
      Origin = 'IMPORTACAO_DE_XML'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFIADO: TStringField
      FieldName = 'FIADO'
      Origin = 'FIADO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosREL_VENDAS_POR_PERIODO: TStringField
      FieldName = 'REL_VENDAS_POR_PERIODO'
      Origin = 'REL_VENDAS_POR_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosREL_PRODUTOS_MAIS_VENDIDOS: TStringField
      FieldName = 'REL_PRODUTOS_MAIS_VENDIDOS'
      Origin = 'REL_PRODUTOS_MAIS_VENDIDOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosREL_ESTOQUE_PRODUTOS: TStringField
      FieldName = 'REL_ESTOQUE_PRODUTOS'
      Origin = 'REL_ESTOQUE_PRODUTOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosREL_CONTROLE_FIADO_CLIENTE: TStringField
      FieldName = 'REL_CONTROLE_FIADO_CLIENTE'
      Origin = 'REL_CONTROLE_FIADO_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosBLOQUEAR_CLIENTE_VENDA_FIADO: TStringField
      FieldName = 'BLOQUEAR_CLIENTE_VENDA_FIADO'
      Origin = 'BLOQUEAR_CLIENTE_VENDA_FIADO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosRECEBIMENTO_DE_PG_FIADOS: TStringField
      FieldName = 'RECEBIMENTO_DE_PG_FIADOS'
      Origin = 'RECEBIMENTO_DE_PG_FIADOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCANCELAR_VENDA: TStringField
      FieldName = 'CANCELAR_VENDA'
      Origin = 'CANCELAR_VENDA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFECHAMENTO_DE_CAIXA: TStringField
      FieldName = 'FECHAMENTO_DE_CAIXA'
      Origin = 'FECHAMENTO_DE_CAIXA'
      FixedChar = True
      Size = 1
    end
  end
  object dtsMunicipio: TDataSource
    DataSet = qryMunicipio
    Left = 944
    Top = 336
  end
  object qryMunicipio: TFDQuery
    OnCalcFields = qryUsuariosCalcFields
    Connection = ConexaoLocal
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 100000000
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from cidade ORDER BY uf_sigla')
    Left = 944
    Top = 280
    object qryMunicipioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryMunicipioCID_CODIGO: TStringField
      FieldName = 'CID_CODIGO'
      Origin = 'CID_CODIGO'
      Required = True
      FixedChar = True
      Size = 7
    end
    object qryMunicipioUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Origin = 'UF_SIGLA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryMunicipioCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Origin = 'CID_NOME'
      Required = True
      Size = 40
    end
  end
  object qryUnidades: TFDQuery
    OnCalcFields = qryUnidadesCalcFields
    Connection = ConexaoLocal
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 150
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from unidade_produtos ORDER BY sigla')
    Left = 416
    Top = 280
    object qryUnidadesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUnidadesSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryUnidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object qryUnidadesSIGLA: TStringField
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      Size = 15
    end
    object qryUnidadesFATOR: TFloatField
      FieldName = 'FATOR'
      Origin = 'FATOR'
      DisplayFormat = '#0.000'
    end
    object qryUnidadesPODE_FRACIONAR: TStringField
      FieldName = 'PODE_FRACIONAR'
      Origin = 'PODE_FRACIONAR'
      FixedChar = True
      Size = 1
    end
    object qryUnidadescalcSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcSTATUS'
      Size = 15
      Calculated = True
    end
  end
  object dtsUnidades: TDataSource
    DataSet = qryUnidades
    Left = 416
    Top = 336
  end
  object qryParametros: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'SELECT * FROM CONFIGURACOES')
    Left = 336
    Top = 288
    object qryParametrosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryParametrosBASE_LOCAL: TStringField
      FieldName = 'BASE_LOCAL'
      Origin = 'BASE_LOCAL'
      FixedChar = True
      Size = 1
    end
    object qryParametrosCAIXA: TStringField
      FieldName = 'CAIXA'
      Origin = 'CAIXA'
      FixedChar = True
      Size = 3
    end
    object qryParametrosTIPO_DESCONTO_PEDIDO: TStringField
      FieldName = 'TIPO_DESCONTO_PEDIDO'
      Origin = 'TIPO_DESCONTO_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qryParametrosTIPO_IMPRESSAO: TIntegerField
      FieldName = 'TIPO_IMPRESSAO'
      Origin = 'TIPO_IMPRESSAO'
    end
    object qryParametrosCERTIFICADO: TStringField
      FieldName = 'CERTIFICADO'
      Origin = 'CERTIFICADO'
      Size = 120
    end
    object qryParametrosID_UNIDADE_PADRAO_ENTRADA: TIntegerField
      FieldName = 'ID_UNIDADE_PADRAO_ENTRADA'
      Origin = 'ID_UNIDADE_PADRAO_ENTRADA'
    end
    object qryParametrosID_UNIDADE_PADRAO_PRODUTO: TIntegerField
      FieldName = 'ID_UNIDADE_PADRAO_PRODUTO'
      Origin = 'ID_UNIDADE_PADRAO_PRODUTO'
    end
    object qryParametrosCRITICAR_ESTOQUE: TStringField
      FieldName = 'CRITICAR_ESTOQUE'
      Origin = 'CRITICAR_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object qryParametrosMENSAGEM_IMPRIMIR: TStringField
      FieldName = 'MENSAGEM_IMPRIMIR'
      Origin = 'MENSAGEM_IMPRIMIR'
      FixedChar = True
      Size = 1
    end
    object qryParametrosUTILIZA_FIDELIDADE: TStringField
      FieldName = 'UTILIZA_FIDELIDADE'
      Origin = 'UTILIZA_FIDELIDADE'
      FixedChar = True
      Size = 1
    end
    object qryParametrosVALIDAR_CPF_CLIENTE: TStringField
      FieldName = 'VALIDAR_CPF_CLIENTE'
      Origin = 'VALIDAR_CPF_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryParametrosCERTIFICADO_DIGITAL: TStringField
      FieldName = 'CERTIFICADO_DIGITAL'
      Origin = 'CERTIFICADO_DIGITAL'
      Size = 120
    end
    object qryParametrosID_CSC_NFCE: TStringField
      FieldName = 'ID_CSC_NFCE'
      Origin = 'ID_CSC_NFCE'
      Size = 2
    end
    object qryParametrosCSC_NFCE: TStringField
      FieldName = 'CSC_NFCE'
      Origin = 'CSC_NFCE'
      Size = 100
    end
    object qryParametrosNUMERO_NFCE: TIntegerField
      FieldName = 'NUMERO_NFCE'
      Origin = 'NUMERO_NFCE'
    end
    object qryParametrosSERIE_NFCE: TIntegerField
      FieldName = 'SERIE_NFCE'
      Origin = 'SERIE_NFCE'
    end
    object qryParametrosFORMA_EMISSAO: TStringField
      FieldName = 'FORMA_EMISSAO'
      Origin = 'FORMA_EMISSAO'
      FixedChar = True
      Size = 1
    end
    object qryParametrosTIPO_AMBIENTE: TStringField
      FieldName = 'TIPO_AMBIENTE'
      Origin = 'TIPO_AMBIENTE'
      FixedChar = True
      Size = 1
    end
    object qryParametrosLOGIN_FIDELIDADE: TStringField
      FieldName = 'LOGIN_FIDELIDADE'
      Origin = 'LOGIN_FIDELIDADE'
      FixedChar = True
      Size = 14
    end
    object qryParametrosPW_FIDELIDADE: TStringField
      FieldName = 'PW_FIDELIDADE'
      Origin = 'PW_FIDELIDADE'
      Size = 100
    end
    object qryParametrosURL_FIDELIDADE: TStringField
      FieldName = 'URL_FIDELIDADE'
      Origin = 'URL_FIDELIDADE'
      Size = 30
    end
    object qryParametrosDES_APIFIDELIDADE: TStringField
      FieldName = 'DES_APIFIDELIDADE'
      Origin = 'DES_APIFIDELIDADE'
      Size = 100
    end
    object qryParametrosDES_USUFIDELIDADE: TStringField
      FieldName = 'DES_USUFIDELIDADE'
      Origin = 'DES_USUFIDELIDADE'
      Size = 100
    end
    object qryParametrosDES_SNHFIDELIDADE: TStringField
      FieldName = 'DES_SNHFIDELIDADE'
      Origin = 'DES_SNHFIDELIDADE'
      Size = 100
    end
    object qryParametrosBAIXAR_ESTOQUE_LIBERAR_PEDIDO: TStringField
      FieldName = 'BAIXAR_ESTOQUE_LIBERAR_PEDIDO'
      Origin = 'BAIXAR_ESTOQUE_LIBERAR_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qryParametrosID_CLI_PADRAO_LANC_FINANC: TIntegerField
      FieldName = 'ID_CLI_PADRAO_LANC_FINANC'
      Origin = 'ID_CLI_PADRAO_LANC_FINANC'
    end
    object qryParametrosID_CONTA_FINANCEIRA_PADRAO: TIntegerField
      FieldName = 'ID_CONTA_FINANCEIRA_PADRAO'
      Origin = 'ID_CONTA_FINANCEIRA_PADRAO'
    end
  end
  object dtsParametros: TDataSource
    DataSet = qryParametros
    Left = 336
    Top = 440
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    Modelo = ppEscPosEpson
    Device.Baud = 115200
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    TipoCorte = ctParcial
    LinhasBuffer = 100
    Left = 409
    Top = 136
  end
  object qryAUX1: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'SELECT * FROM venda_detalhe')
    Left = 336
    Top = 384
  end
  object qryAUX: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'SELECT * FROM venda_detalhe')
    Left = 416
    Top = 408
    object qryAUXID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryAUXID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
    end
    object qryAUXID_VENDA_CABECALHO: TIntegerField
      FieldName = 'ID_VENDA_CABECALHO'
      Origin = 'ID_VENDA_CABECALHO'
      Required = True
    end
    object qryAUXGTIN: TStringField
      FieldName = 'GTIN'
      Origin = 'GTIN'
      Size = 14
    end
    object qryAUXITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryAUXQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryAUXVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
    end
    object qryAUXVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
    end
    object qryAUXDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'DESCRICAO_PRODUTO'
      Size = 120
    end
  end
  object qryPedidos: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      '   SELECT p.*,'
      '          c.nome AS cliente,'
      '          c.fone,'
      '          f.nome AS funcionario'
      '    FROM pedido_cabecalho p'
      '                 LEFT JOIN clientes c ON p.id_cliente = c.id'
      
        '                 LEFT JOIN funcionarios f ON p.id_funcionario = ' +
        'f.id')
    Left = 384
    Top = 224
    object qryPedidosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryPedidosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryPedidosID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = 'ID_FUNCIONARIO'
    end
    object qryPedidosDATA_ABERTURA: TSQLTimeStampField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
    end
    object qryPedidosDATA_CONCLUSAO: TSQLTimeStampField
      FieldName = 'DATA_CONCLUSAO'
      Origin = 'DATA_CONCLUSAO'
    end
    object qryPedidosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 2500
    end
    object qryPedidosCLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryPedidosFUNCIONARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FUNCIONARIO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object qryPedidosFONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FONE'
      Origin = 'FONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
  end
  object dtsPedidos: TDataSource
    DataSet = qryPedidos
    Left = 432
    Top = 224
  end
  object ConexaoLocal: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      
        'Database=C:\Users\Dennis Sobral\OneDrive\Pedido (OnLine)\DB\PEDI' +
        'DO.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 672
    Top = 208
  end
  object ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS
    PathPDF = 'C:\'
    Sistema = 'SobralInfo PDV'
    Site = 'www.sobralinfo.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = frmPedidos.ACBrNFe
    TipoDANFE = tiNFCe
    ImprimeNomeFantasia = True
    PosPrinter = ACBrPosPrinter1
    Left = 857
    Top = 77
  end
  object ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS
    Sistema = 'ASK'
    Site = 'www.gprotech.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    MsgAppQRCode = 
      'Consulte o QRCode pelo Aplicativo dispon'#237'vel pela SEFAZ do Estad' +
      'o'
    ImprimeEmUmaLinha = False
    ImprimeDescAcrescItem = False
    ImprimeQRCodeLateral = False
    ImprimeLogoLateral = False
    FormularioContinuo = True
    PosPrinter = ACBrPosPrinter1
    ImprimeChaveEmUmaLinha = rSim
    Left = 856
    Top = 144
  end
  object ACBrSATExtratoFortes1: TACBrSATExtratoFortes
    NomeDocumento = 'PDF_Ultimo_Cupom.pdf'
    MostraStatus = False
    PathPDF = 'C:\Users\Public\Desktop\'
    Sistema = 'G4SAT'
    Site = 'www.gprotech.com.br'
    MargemInferior = 4.000000000000000000
    MargemSuperior = 2.000000000000000000
    MargemEsquerda = 2.000000000000000000
    MargemDireita = 2.000000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    Filtro = fiPDF
    MsgAppQRCode = 
      'Consulte o QRCode pelo aplicativo dispon'#237'vel pela SEFAZ do Estad' +
      'o'
    FormularioContinuo = True
    EspacoFinal = 50
    LogoWidth = 100
    LogoHeigth = 70
    Left = 96
    Top = 232
  end
  object ACBrSATExtratoESCPOS2: TACBrSATExtratoESCPOS
    Sistema = 'G4SAT'
    Site = 'www.gprotech.com.br'
    MargemInferior = 0.800000000000000000
    MargemSuperior = 0.800000000000000000
    MargemEsquerda = 0.600000000000000000
    MargemDireita = 0.510000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetMascara
    CasasDecimais.qCom = 3
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.000'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrSAT = ACBrSAT1
    ImprimeMsgOlhoNoImposto = False
    MsgAppQRCode = 
      'Consulte o QRCode pelo Aplicativo dispon'#237'vel pela SEFAZ do Estad' +
      'o'
    ImprimeEmUmaLinha = False
    ImprimeDescAcrescItem = False
    FormularioContinuo = True
    PosPrinter = ACBrPosPrinter1
    ImprimeChaveEmUmaLinha = rSim
    Left = 112
    Top = 368
  end
  object ACBrSAT1: TACBrSAT
    Extrato = ACBrSATExtratoESCPOS2
    NumeroTentativasValidarSessao = 3
    Config.infCFe_versaoDadosEnt = 0.070000000000000010
    Config.ide_numeroCaixa = 0
    Config.ide_tpAmb = taHomologacao
    Config.emit_cRegTrib = RTRegimeNormal
    Config.emit_cRegTribISSQN = RTISSMicroempresaMunicipal
    Config.emit_indRatISSQN = irSim
    Config.EhUTF8 = True
    Config.PaginaDeCodigo = 65001
    Config.XmlSignLib = xsNone
    ConfigArquivos.PrefixoArqCFe = 'AD'
    ConfigArquivos.PrefixoArqCFeCanc = 'ADC'
    Rede.tipoInter = infETHE
    Rede.seg = segNONE
    Rede.tipoLan = lanDHCP
    Rede.proxy = 0
    Rede.proxy_porta = 0
    Left = 264
    Top = 368
  end
end
