object BaseFormT: TBaseFormT
  Left = 0
  Top = 0
  ClientHeight = 424
  ClientWidth = 947
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 947
    Height = 38
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 81
    Caption = 'ToolBar'
    Color = 14079702
    GradientStartColor = 14079702
    Images = cxImageList16
    ParentColor = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object tbShow: TToolButton
      Left = 0
      Top = 0
      Action = actShow
    end
    object tbAdd: TToolButton
      Left = 81
      Top = 0
      Action = actAdd
    end
    object tbEdit: TToolButton
      Left = 162
      Top = 0
      Action = actEdit
    end
    object tbDelete: TToolButton
      Left = 243
      Top = 0
      Action = actDelete
    end
  end
  object ActionList: TActionList
    Images = cxImageList16
    Left = 704
    Top = 104
    object actShow: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100
      ImageIndex = 3
    end
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 2
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 1
    end
    object actLookup: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 4
    end
  end
  object PopupMenu: TPopupMenu
    Images = cxImageList16
    Left = 704
    Top = 160
    object N6: TMenuItem
      Action = actLookup
    end
    object N1: TMenuItem
      Action = actShow
    end
    object N2: TMenuItem
      Action = actAdd
    end
    object N3: TMenuItem
      Action = actEdit
    end
    object N4: TMenuItem
      Action = actDelete
    end
  end
  object cxImageList32: TcxImageList
    SourceDPI = 96
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 4194348
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001F744558745469746C65004865616465723B41646420486561646572
          3B4865616465723B7AC1DA85000004EF49444154785E9D574D685D4514FEE625
          A1694D555029D88514C1853F88421B7F4AA129B4622AA51BDB2ADA4A34E04A34
          48419A6D772A2E34B449B0D88A1574A10BB5DAD6BF5AFCC19590528B622B4568
          FC4B62D297DC3BE7339E7B86F3C69747A293773373DE9D39F39DEF7C73861750
          B5A04FDE727BF1770420D6B76C249B1C8557DFFAF644A8858D20C000049A1712
          0101D43F9DAC23FDD85C90BEBD99DBB7DC8CC3C7CFE2FB8B7F80424421843C29
          919B44044242A2E0C8602FDA0184F9B671F7F63BF07F1B99DB2100677EFE0D8F
          ECEA060DECE8A1533D7B1EBD1724D51E1EFD54E72A80B43E463AB9ACC664B000
          3D5284E64DDB0250ABD5D204147351233F7B7E4AD71685208A400CD05C111D80
          7BD35E4DEF13D79EDCC084A202560B01A1161082CBA328A30694362D8B1265A4
          8E2944D908400C000DCB85B7775A9293682451A9FFA88680E66CCDB697F0FC7B
          BF60ECC2042412B43C9742DD94AC00BD327492FA4E008A9C04B0A9DD42CD151A
          2356DFBEAEDA044E0721D010B457C16BBF6CE5B5F8EEC7313CB667BDFA10CB73
          19130062FDE63B71E3EA2E882E250E0C7DD4E30C10DEA8E8C0F2328ADFCFC1B9
          A7B342515B7B21964B89A288885130F6D3A4CE130B88BE0C67CE4F9A7FFC3B05
          B99A254648390BC6D25743003A13C97362A92CCB2A62113091031A8800D2C702
          A28C0D002802B8D67563163368BB621540F1A8ABC753C1A81AE0DC146E5B7335
          86868EABF229542D6CE85D5B012171E29DD34A7D4A91083F30009E7BDA539FAE
          E3DCC79F8322EA48441400236C71D4352CABCDAE3AFB1C9EDDB60F1D3B6F4508
          011D5DD7A1E7C9C3B86155177EB83855E9A18CD8DDBF59838D021C3A70AC3905
          554FDCD4FFA1519D6BC3EBA19A9E33B367CDECD09408E64A49474FEDA2146521
          8ABECF52E03AF36A035A31F2835019B4EAC5C6775959D48875C368B4C728982D
          A2663152EB4323039591361C3EFA354877EBC304840E98EAA1424362FCD709EC
          DFBB156B6FB91EA32FBF0F316A8572ECB579DA756C201D80E49749DF83EB3C72
          D03E6666913A23EE9398A9977871600B6AB580E9E959ACECEABC06C064F36DE8
          29C8F23AF2E63720C44B3013089A0D4F831DB5E4F7D2F89FD8F7D47D98F86B0E
          2B3ADBF1C2F027ADAEFBC614E48EFB76AC4D513789D165E13AD1517E87D81AA3
          DB37375E73009058119C9C8D1CFDCA23CE8068E73A30C3ED30AF818A8174AF88
          880368C500C92C057D3BBAC16679AB43869026E6CA4F8186BCAE4481B7D62988
          3A99424DFBC81B5FBA13BAC3BC0FCE8A8103894BF30C0C3E7D7FB676510DC4C8
          2C437D3BBBD5F44833D3D8C8D3E998084A305084C4A5A42056861895C3CA409E
          6B509DB6D086F7E3FF9C82677A6DB1FA5C1C804804E885E5F15D77250099369A
          2B5E23286F2E8B5C844B3E86078F9C763B79A703918C0107982AE1E0C056805E
          1F16AF03E2622280271EBAC7C5163C3C5AC46EA7D7696C7EC834FFBF321074F1
          C1D7BFB053018765E9F1CBA8F91A07A91A181C78000C55FEB9140D44A1D12D3A
          B7FFE1BB2D92E03560A16BD990D01064730DA0089622428BC4CABF955557F882
          57B46F043890042CA59E583C05A0C2E4C2253793B80DC5CFBCF956E40C84A34A
          0CA4C5AD4528498457AEE8C894ED05C781B87F079A5861E3FB94FF0A4004C056
          008AFAECCC677BF7BFBB2164D17BD1C9D9C86B01930E64E15FC0F5FAF42900B3
          00A4D5CFEC4E00CB012C03D0D6FACCE6DF2D610E2DF23A80E90482CC89F81B9B
          80C88D17035E030000000049454E44AE426082}
        FileName = 'Images\Reports\AddHeader_32x32.png'
        Keywords = 'Reports;AddHeader'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001A744558745469746C650052656D6F76653B4865616465723B44656C
          65746554D17647000005EC49444154785E9D977F6C566715C73FCF7D4B0BD418
          32EC60A5C026B02618D6216991C51156D66C9DA22126EE07B2A9650C31719B98
          69182C82A6EA5F12B2A5A1EBB698304565301892A801926EEC47575668AD6DE5
          D700858592EE65A5E57D79DFFB1C977B9F2727372FAF659EBC3727F779EE7BCE
          F79CF33DE7B9D7108B71974AC1FD987B0258A78B8A4872BB0430AFEC3C72C004
          E61E04C48011674504834110C47915E24D71CFE20D7A2520EA0D81834F3C5CB7
          149542009FCA3D8F2D9FCFFF21EA542CD65A8220000CC610E997FEF47E3D9002
          02408C31619C0851001E71180A18B58A01917841D048E3754D698030B4FF0D46
          0FBF49697D03372FBD972095028486BBBEC8DBDFFDCE9A8A891337A533D996DA
          977FF74BE09AB3440C5704B52E915101AC8044F768DA49A63D40B8B8673741FA
          02D31EFD26C3EFB5736EFF7EC27C9E7C2EC7B8FE4E6E5D50F3FC8C1FAC983CE3
          ABB51B0EAF7CE4E72E70CD807506C56139FBDA43CE9B278D756976758D6EE2B5
          99CBDBF8F8E00166ADBC9FDCBF3EE0B67B17D0BFF71027AE6698F0B97252C77B
          98BAB886DC4027E5955FA0DCA4D6009B819C03A01189D38421D36AEA6227CA2E
          040B5620D236867CF534A54B1B18F8FD3E662FBD93ECC97EAA1B17D2B3EB10E3
          2BA73065C97CB27D1F20167A76EEA6F3C8C0662024990154A2E02C92BF4A6EE8
          B85FD31A38C281C47AF004D3163DC9A94C3DDDAFBDCEDC863B19EDEF666E632D
          C618468F7644CF75EDEBA0E3D8E99FACFFCF87DB5CF48500C4691B86D87C1609
          F35A782C886602F180B2E48EFD86998B9FA17FF43EBA76EF625EFD5C868FBCE3
          1B97AE03BDB4777FF8ECAF873EDA0664004900106B41B91E3996DC28A9F22920
          56A38E2F2D858488153029489552525AC684C993B9767998F0F215BC4CAA9AC1
          4D43B980A18F4CE11CD0DA23EECA8C64387EE8CDA8143614ACB5110009C18A60
          6D18774A5E2055C6EC155B39FFD75E460FEE67CEFCE98CF4F5A2ED0CD3AB6752
          772DFC457336975F3FD0FD3C300AD88212C45AB87DF5DF5CAA5510741EA2ED18
          10D2F3EA0E3ED9B78BDB6B6E217DA413031CED388519574ACDFC2AAEF4F533A3
          AA92CC95CA5F3D97B966369FE9DF025C052D81F24CA70DE286913682010F4340
          0C51BFF7FCB685BBEB6731DCD38B58E11F3DFF66D2F7D78258BA5E6965DE1D95
          E44F9DA6AAE2266E26F533A02501C08A05F00E79714707E21069B4C903C5AF35
          DE3D8B5BBED148DFDFDF607A450903FFBC40C5DA1FF1E5C7571104D0912AA1BB
          F505AAABA772F6F419CE0D5FD95ED805367998347DBB4E2347FC8F64497C9642
          A63EF314EDF990F63FEFE14B9F3A5FB07A1504658C1F5FC29465DF62E7A6E6E6
          33697E7831CC6DDF327CFE391F7DB20BB4AEB4FDF17DD76AC647AC1C403BD3B8
          B5D2718625DF5BCD9267D7D177F252E41C13604CC05F0E9DA42D9B6E219BDE0A
          8C38E7B67014AB619A1EACF55117905169E133A0D4B402D573A683168F5C3EC4
          F5FE65202F2252D086364C1E426D3BDED388134092A7A0B7A5F786C14B69363C
          79BF3F57B0D6167DB9D11288244AD0F4E0C2E4F10B0E2088311E11BAE5511A30
          C9B9125A8A8B96204400B1821868FBC3BB6A44D460521BCD8A038708172FA5D9
          F8F403C9FF82014C5100612800BEB8343DB410A02052D1353F13F0A29804B1C6
          81126C7823250801C0BA54BE186520596B24325A841BAA0707D36CF8F1D71C2A
          67732C00D686A06F3DAC7AF82B28BFD49152424356302A4A8B314858AC0D5BB7
          BFADF7DEBA468C55A7A88ED10F5EBACCC6755F07973911C6E680B54A26011E7F
          E42E74346B78A211EB89A1F8309E94FA8AF75933100F96D6570FBBAE4061B9F2
          E861843AD232451CD8B86E1962E2FACB8D7020B4AEC7B18061F58A45880304EA
          B4E0588E946F4192CF3A80D67223247491B8F16FC01955C78547B43A0205E281
          F9D20B6397008960CAF547AE5AD32EB0DAF3DE3662104F087460F9E08A9310AC
          27E1E7278E4B305B078E0251FB0AD46745745FBF1F62002120C500E432D9D1F6
          9F36EF5DAC2C56146ECC1682F0D9F23CB0D7FF02CE6446DE02B2802DF6993D1E
          98009401A9623D5BB036F633E222CF00231E440C4EE5BF03BB5FEAEB82AED800
          00000049454E44AE426082}
        FileName = 'Images\Reports\DeleteHeader_32x32.png'
        Keywords = 'Reports;DeleteHeader'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000007A149444154785E9D970B7055D51586BF7DEE2B348F128B029647020A
          88114C11250202F2D2A9D8226D79848129E274A6B456063AE5A540B0012914C7
          6A3B5068181E1679D596AA94966793064281100C82080D508A080448B8CF73CE
          5E75923DF77027103A5D3377D69E7DEECCFAFF7FFF6BCDDE0A2F94F991BA67E2
          EEFB026893EF1822A99FFD26AB92CD87762A4B0D4240142801011041A1100431
          751010F33F4400B871E3E682692F0D2AC28078B3A44C108D005327F5E74EE1C7
          30FF32064D1C99CFDD229170B05D8D63BBC46D8768D4A1F6469448CC7E75E13B
          DBD5CC29CF1401EE2BDFEF4BCDF95AD9F8E1519A094F01310BD7154F60695C8B
          28C35DD0623E2985A07045283B7C9629E30B8844ED397397FE59CD9FF65C11E0
          E4B4BF87D7DFFAABFC4F008C9480246B7BD9E80D583E0B10C467E15A8DEB78C2
          06A0A0570EAED6B367146F558B66BDD00062CECB4335207705A04D45315836EF
          3E8918BA22D2B016A382E8C6FC7CFF071014F1980D80CF67D1AF77275CDB9D35
          75EE06B56CFE9822C06ECE9C068047594C1E35B00B498FA9E46978661488C66D
          440BB1780200BFA550580C78B20B8ED633E333D6F0EB4513524034A3005E089C
          7FB62F0659A302920A1281D61F94A250C4E3364A81DFA7B02C85CF270C1FD00D
          EDBA3313F62A562E7D711E49EB284CC8E91F8C15D3051E0031B9DD47A5A63C9E
          0408925C2B6CDB2510F2919511E295795BD0E2B5280883FB75E5A1EE0FCE047E
          0E70A4F05BB303A8D76C28CA5FFFFE82CECB7FAFBD2ED0DA630CBCBBBDDA30C7
          640340308584F1DFEC498BB420E3463EC1CD48ACC18CAE2338AEC6765C2C84CF
          CED60204F73E376446CB9C76733AFCE827D42C2E7E6DEF8821D6806D7F2BF2A7
          4E2810F31B3BFC61045022C93D6F0E81326A84023E7C5969646684B05D8D6BBB
          8D006C0785E0D835CC7D7EF2AC360FAAE91DA6BC4CE4C3CDB41DF10C57DE5E3D
          675BFF02D5C4038D59A879BAB741636C6794009335E4EC3B4CC9FB874D8708A2
          BD19F2BD6179203635E72FD361F8B8E999630B086F5D46F8E36AFC5616E93D7B
          7069EDA6D92947201E433AEE3C0828C4B3BFD79278A37AD2C85EE07D46B4266E
          DBC4E309C2556B69D5BA3B8585FD397CE23F7C2D964D6EFBAE942D7A93BA6882
          4BD1E862CF84A23D760A4AFE7804118FB916A0210B18C6C97D04052814F90FB5
          A56B4E36370E97708F5BC1DC1F8EE18383E7B87AED26D6A3C3285F3083CCFA28
          A7EAEB972CAEAF2BF28E40DFCA12268EC837CC3D5952BD207893015C57E3BA2E
          F17894CBE5BFA51507693B7C2152B394B6D1FBB1B24650B27E379FA7F5C4E79C
          58BAA7FEC27C20D1A40BC42058B5F550D2FD9347F5E6749F3C03421025200A01
          94CF87845A90397132A16F7F97DAF29564C7CA683772094ECD7BB8572AC96B13
          62DBFADF71F65F7E3EADAE5A76FD8B63454002709B8E623167FB422F8FB508B9
          E5C7005227A280D69A846D138D84F9E2EFCB69152BA3E3C83788552DC1BD7A1C
          DDB61F9F6CDAC0E0B8E6E0A5F437AF9FAF9E0FC400A74F56176D3C00DA156FEA
          012B361EF06640D37900027EBF457EB736E4B6CBE2CABE2F8BC7FF41C7510B89
          1C58087527715A3FC9898DEF515F2F1C3F1DF9D58E23350B30C5013912E88451
          00CBD50E02682D888297BEF338A2BCA906788AE8462076C2A63E5CCFC55DBFE1
          DEBA3DE416FE82707931F6A56A54EE408E6DD842386151792AB272D69EEBC540
          14B001299CBA5636AF594BD203AE2B6605089CEADDCDB0D6280C7B1460A14241
          02BD1E2763DE1B9CDBB196F4E8451E185D445D6931CEA58FF17528A072FD1FA8
          8B09C7E8CBAB7BB62C0522E6DCE59FB3726487EF0C175A9DF300880B40729E77
          AAF824C594A00C7B8DD6423416E5E2F18384AB7633E49DBF50BB6E18EEB51358
          B90554BCFB1191B8C2FF68219F871F03B6C430C50FFCB4BDB8B6CBE0F80AD2B3
          AFE3CD01ED1A7D4104DE5E576A587B92836029457A0B3FCF3ED599AB47F672FF
          634F73F9E421ECB3470974EFC3FE75DBA98F58A8FC71F4183B9D5DABCB011C30
          F8E3368613B623DCB10BA68CEFD7F40E60FA3D168B72E1C2452AAAFFCDB4D727
          113E53CAD9EC095C59B39CFA8442F71CCD23A3A79199918965F93D1301AEEDA2
          34B4CC0237712B805B6F3CC05BABF7221A44BCA967892210540CEFD799FD1547
          A96DD995F8C54ACE5456F169C5211CE9485A5E018F8C9B4E46662681509A510E
          3C009AEC0CC84A131C57DF4E018588F0E3090300F07C609C6FDB5CBB7E8DB2FD
          557CBD431E13676F2474F514CF3C9147A0E3377878CC1432B3BEDA501CA5485A
          DB44A6CF21C3E7624760DCD080E701579B5E47038A5FAEDA85D6003A7907B004
          8201C598113D3876B4929ACFAA1834B02F43874EE5BE7BEFC3F2F9C8C8482710
          0C61290B00AD5301B40CDA9000D7104E3902A0517605535F1C84377330EAE806
          0FC41331B66E5A81E33804024182A110C1A01FAD05BF3F688A2BD3393A058063
          6B30C53D00A6BD403CB9F1FE2749140A6559040369F8B30268D158CAD7B06729
          0BEDD3282C50DE5DD2104B8258BFD3BDEDA5541B1392F59540CABD0024E56122
          82B9AEA78244791D84789E410B800BC89DDE861AB063F1C8BE9F15FFE92995C2
          5E40BCC2DE85C484987D2588BEFD0334160B9702715387F9A7EC26AF5C0B0802
          2D8010E033FBAAD957F1DDBF8B611E03C21810B75340CC987480703385FF9F10
          4037F732FA2F54B1C7D26C24F3C00000000049454E44AE426082}
        FileName = 'Images\RichEdit\TrackingChanges_TrackChanges_32x32.png'
        Keywords = 'RichEdit;TrackingChanges;TrackChanges'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000049E49444154785EC5964F88956514C67FE7FB661A8B72112E222AC4E8
          DF58565A86352562A613FDD1691639D4F47F2584E222C70C7512732345542B43
          9020B1144CC9A23F90688BCAC4AC458BA0B4B692A033F7CE77DFF749A6977B78
          993BE385169DD57BBFF3C279CE739EE73DD724F17F4607809991C2767E7CEC2B
          2B6C1102199840001286218400038440A07497D4CCD9B3E75E5FFBD2A2612002
          7A6BE751A1888035CFDF4F0A24D181870166668B9E597127EDC4D858832A441A
          55A05E35181D6D70E6EC2823B5EAB537DEFDCC86562D1B06C2EAE7EEE3F7D367
          B4E7D313AD19F0C0940E2108BC2B30900C52E70031A564863082C4D11FFF60D5
          530B1819AD366CDC7ED036AF7D641868CCBCF64AB6BCFD852E0AA05910F9B189
          43D00401455900426541280A40D4C72A0016CC9B4988F1D5755BF7D9B6F57DE3
          2036BCBC24029A12404C5595B0ECDA7F3C032109307274F0446F37C2A8D72A00
          CAB2A0E7EE59842AAC5FB371B7BDB9F9C961A022E96212004EB924040C3E7E07
          005ED705986A8360B45EA1286AF531003A0AC3285878EF8D34621CAAAFDBC57B
          DB067310AD19C8C19CEAEDC103778465F260C6FE6F308C7ABDC20C3A4AA3288C
          B2144B17DE4C0C6168AC7A9F1DDB5FD804A815004B009C6EE09A43479A859D7A
          01869C1AAA2AD0D95532FDF22E566FDA4B945B14C4E29E9BB8A5FB8621600B10
          2677418CDEABE0830327DAD2C0CAC7E670E9B44B1858710FE7466AE3620C0DD1
          0891AA11280D7E3BF537403995085301E768E0D1DB1332A56F1EC8B910465767
          49397D1A575C60A10A91508571008D46A03088C74F37999EC205641E3FF5E07C
          9017C60182FCF7755F7FCFEE833F01428E94BEDED934AA4847099188179F6204
          4DCB23661C38EACC18A0FC5D106082F3A3632C5FD2EDE0A06947303A4B233698
          1C808B3066A3D8F7F92F131E26A10940C07C7C8E80810B365611E9280A626C83
          8118011F03CB1FEA26E35CB4D042B69E727D4A146614A5A17647E0348ABD874E
          A61A467FEF6CFE5A3C2F03E49351FE54A7DCAC6F4F22415114C4A07644E8340A
          E85B7A6BB35E8CE2AA2F7FC81B271B413A794EF266A2E40CA46BB90620A15473
          9E1F1DFAB959CD856720B91300817FC3134FAF989BF60AED69207B07047DCB66
          7B361721C2E9CEC7E27584A742C463F2110404280A803F7B6E0379114B67C900
          B766264B3923D71FFBD547A1363410826F9828B8FAF049CF3AC55ED3C14C3405
          A06809B088A19D118464C134F33D07D32EC8E60FCA0B66749BFC3CD83FB7998C
          521B0F510C99D1FB1F9ED36A1DFBD95B766DE0E14E9842849230B39636DC93B6
          A15A2C1F103173A20B30C1E0D9FEBB928352AE9506CCCCFC2514C285F6E2CAF9
          249039B7DEB1D707E45800A85721E5AD3D1B3A038624767CF8DD7F6260B06F1E
          B2A4A9763410A29012B9D8B888940091BBDEC588E500FC82039788918B33101A
          01489751BE7A9938022F2C9039304BBF714D85182EBA0B62D200D32FEBCC6877
          BFE36ACFECE98F0D06F27C5384440184C9FE9647A0AAD5470EBFB2F593074C42
          DE3DC8375C0E827C579850CCD7710A6AB5F347807AAA950150FA38FACE9681E5
          401750667465917F6BE38E52E735E0BCB3903320600C68A44BED146E3FBCC988
          13C73F01B46C1FCCDC7AB40000000049454E44AE426082}
        FileName = 'Images\RichEdit\TrackingChanges_ShowMarkup_32x32.png'
        Keywords = 'RichEdit;TrackingChanges;ShowMarkup'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000001C744558745469746C65005461626C6550726F706572746965733B54
          61626C653BE8BCC9780000071D49444154785EC5976B6C14D715C77F77766777
          BD5EB0B1B1B18979630C1B301048026D52993E92348FAAA51FF281B652BF0435
          7CAE92564AD40F79546DA548A5511BB5AA1A421B5515491049684952A52A9434
          404213A7F2030CC6AC8D5F783DEB7DCCCECEBDBD9A9DD5959071A544558FFCF7
          9973EF9DF9FFEF3967EED84229C5FFD3A2FC8F6CFF6B3D48A9F0A5ACF92EEDBF
          A1D1E54BB5454A89EFCB1DF30A1042F0296CDE9BF6FD61F7234AA91FA6E2A995
          AB9A3BA8B3EB341214CA25269DEC67CE8005440C825884E0E1DFDEF1C2DAA60D
          0F6F5BB183F6866626F3572879654D5EA42215B6155D58C0CC3B3F45FA128562
          E93D8F5BFF7EF9F12FA6EA62CF2A5FEEF42A1E85928BEF2B2C014228224250F1
          7D3D56D1F0992916280D14C9F49FA09CEEA6714D0753B9E160F705B784539823
          BA50BA1B3BBB31462C198BFCBE71CDADAD2291A4FFFC598AD951DA5677B26459
          3B76D4C6B62300A85A191528E5E37B1EFFB8749E8C3B80DF5A4FAE5464AE9827
          9B7710A67E0BD652008B8E3DF9407F77CFFDAD93572F323735CEDACDDB695FDB
          4945C1C887A7A9940A44ED18D1780CDB8E636941B2E2512997031CBFDA8BB539
          4D9F730927EF0442228098A796D19A3720D66CBBD3CEA54FEEB22322DE75DB9D
          B4B4B55198CA20AC088B97AF229E4C82F4B074ACA4A4E2B9782597B25BC42B96
          A89782B35707988C7A6473390A453720B0F6FDECCCDB207AA45228403B94F4AB
          1E1008EA13927C7E8CA5D61BDCBA33CDD2B656F253D7E83D778E8E75EB69D5A5
          882F6E62F2F2054D5AC012160A0552E27B2E7ED92559F6A8774A58C904CE5C1E
          AF52A90A40931FF8DABA80508BC09755AFA4C257920852938D12FBE8049BD29B
          68D1E47313637CF0DE7B34B577D0BCFC160A93A3D88B97D0D6B545AF1D273791
          C1D3A45EA988EF16B577755CA2D5838B3373E44A79A4544401A1C9A84838D937
          032A24D7904A92B4A1921B233DFA121BB776D1B26C19CEC428EFBFFB3796AE58
          45FAB6DBC95EBBC240EFC734EB666C5BBD8E586A31EED5CB94F39AC4AFE0973D
          3CAFACE339EACB65947229F925EDC3F75601BE2FA99A0A21A9B705BE334657E6
          25BABB37043577C6339CFCCB0952CD2D74EFFA1C3399CBF49EFD67207AD98AD5
          38D746284C8FD3A83393482DC22BE671F3B3B8B92CAEBE8E158BC8BC8B543E15
          E98702143A5000A8903F11B5F0F5CE3B3387D8DEDD496B7B5BF0F0BF1E3BC6D5
          CC046BD39B35F9301F9C7A17A960C79EFB98D3C4972E0C32A2519AB94EAC2E85
          2F6136EB303D33CBD8944366620EE57AB4A42CEA921005828E1D1ECDF161DF04
          D5BE91D4C724BB0A47D8BA639D266F273B36C25BAFBC8ADFB299E55D2B39FEBB
          5F10B56D5A566F60F757F732353CC060EFBFC8170AACBE7D13D3572E303030C4
          E0E065B2B29E726EAAAFE0A9BEEB2575EADC16D56179D657102A2D80BA1F1CFE
          A4F0F4BE344A015405388EC3B9438FB1BBE76E66339778F38F7FC2BA653B7BF6
          3F453C1E676CA89799C971065F7986F59D6BC965AF136F68E6CE3DF730F2D119
          06FBFBE91B9E66CBB77FCCF18B36BF79ECA13B8031C0010A80DFF6AD84AA6640
          A91A390A85B004B66DE335A679F127CF52CC392CD9FC25BEFCE8333435356345
          222CDAF6798AC502C9450DBC7DF8208DB64D675394F1A1412E5E18A2FFCA0C77
          1D384847D7565E1F19021807A601F7E4D30FCA236FFE9DE70ECF120504E12F89
          22FC21168BB3FBEBDF25DDB39757DFCFF0604F27A9D4A2805C088B88A5114991
          DEF9054E4F2DA3279DE4E3A3CF691C45D6B572F7819FB3B17B27256CA402301D
          FEF26BEF6045A300B5D71094210F108946A8AFAF275197249228B2B8A12138E1
          40553306081DC76209A49D64E5AA55347CE747CC7DF3FBD8B1184B1A96602712
          B8C54A2DBB82D09E3F53BCF10F12C59FCF4F7065B28854181245001189F0EBB7
          86C33123A0160B08E6A594283494ABE18000199E2B37B368ED35BC775B6B4858
          9364AE5F3831C423F7AE41015585222C57B8A33706F8DEFD9DA044984145B80F
          66F2659E3874DE6420140E180128937E6A0F50E17AB36390A0A88D1B1704CA10
          9B4D848129810618600EA25071A8DD9812E670349AA8E936A00A30E406E10D37
          2901D22CD310A1EA5A0CA6E684E3C2084521C379B3E140AD59231716205070E4
          F418538E8B52848D64CE071DF1ABE3170222AAE30621CDF3AFF72143813511B5
          67486E6AE66BB877D772730E04CED82F35F9FEFBD60713E69D36249A9C471FD8
          58EB07531209D982CB132F9E5F380360528C293A8A2036A99FA7F1801BDE1E61
          BA3CBC1FA5166C42A40415CA36C4A69E37A635B89284A2430865E6C3D49B7B8D
          9CF93210CCCF163C2ABE118169C880389B2F9B66440021A11420F4FC9C67C8D0
          1E7163397DE63101A4F61F3C75CCB6133D12300D06529946A2461E7EAECDEECD
          1A081B4E9A6C01B8F9D9D3479F7A682F701DF0943623006C200EC44C4F20CCFC
          4DE3FF3E66765E001CA004C81B4FC20A200177A1FF113EE5983222A898786102
          1620F82C50F37D0BFE03770D8DE023F05C9B0000000049454E44AE426082}
        FileName = 'Images\RichEdit\TableProperties_32x32.png'
        Keywords = 'RichEdit;TableProperties'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000027744558745469746C6500526566726573683B5265706561743B4261
          72733B526962626F6E3B52656C6F6164CD4DF6E90000091349444154785EC597
          6950545716C72F8B46D151474D3431EEA3A351A3E306384649D4382A91C50430
          C8441425A0B8B3AF028ADA54005101111A9C068128342E40836C02DAB23468AB
          C8DEA06C0DCD4E3774379E39AF7DCFE9E2CBD4D45815AA7E75EF8577CEF99FE5
          5DEA1100F843F9C305FC3F3F1AA31965F0519DAB07D5A4D11A0DF3B7FF498C5F
          5239F1FB1DC1D5176182F82494C4BBC43C4E5473A8793A8C37C723F6F1714F4E
          31CF9B535CE61557A2F4E494283DFEF554E07E93CF73892A3871E437EE5C3531
          1A6EB14F896B0C059FB8B2F9C485FD8438472351D4FA9810DF440191BD7BF701
          CAD09D5DB4FB667E0D44F25E814368A611E5F05060C631BF448132E569033C6B
          EA82FACE01908E8C50E0BE1F7F27813B4FEAC137BE54E918591075D03F6E3623
          6470E41D516780E674642121DEB74A89140F882AFB1F8F058CF7892FA97BD323
          0351F7209C0CCFAFFBBB89DD04330FCE92331179F2AE612534CB95201A5242A5
          4C012FA40AA8C6953AB7C947A003CF778B45E016FD64E06850DA6EF43906D11C
          5062D0519C087B440896F0437044D325BAC8FD415913B463908621052414D4C0
          41569A073A196BE6798715975F0DD518E4F980029E0DC8DFD32F870A9A677D72
          689229E1554B1F78C53E8523C13C4746449FE21D51C7E14A3E21D8235539A8E0
          76812973CF270906C498D1EB410554A0B3C6FE6138793577D0F048C8023D6387
          E9163EC92D5558997A1421A2A9C5672B514879CF309422253D4320EC1B863A89
          143C629E286D0292CD68111A4CF05EC508B10FC92138147C267B6DC7C8C23481
          A80B4428A0B41B9DA1A3E72822FF552B587827A7A383715BEDAE9B183B2580A9
          4B02E81DB80E7ABF448089F32D3817FF044A9B7B5522F89221E077CAA0AC6B08
          044DDD384779BDA6274217D233A14105EF416C7F7B4898E05A0E213CE388F497
          D03A3C02020CCC97C86886A006CBED135304BB8E45995222D6595E76586BC1DA
          3673E9B79328D6FC747EBBAEE5E5886F6D6F0CC7E4544209062F144BA1A05D0A
          CFD00727B71A0E5E78C046DB4F10CD6EF908A1B0B9944954A5DFB4C77E024E6E
          7D0D4EF60B2C5D111AABE89051603652A878DB0D468E09F5B3577C37992EA796
          1ADA94F355465E1B36FC12DE12935D098FD13EB76510725B0740281E84A32139
          CA9DB6AC25F4B31A926125D91F90815B34B60FE279DE2EAA8306EC25A53ABF75
          F03FB4BD4780995CBE530A9B6DC2BDA88164DE7306FA3C76E56E37BD2DB691F2
          426C65F6DB7EC86CEA87A2B601B8765F083F7BDDF6A16D353A8794E478682E21
          56DE715FE1B4CA9A7088F81D52788846D96F07E02192DD8C50677AFFAA4B0666
          2E09F255BBDD56309930E5645A898CD3DF171C791167A2102BF0A0A10F45F441
          AAE02DECF5E66244321ED16C4701478373080E42567AD68B3610E2C094A18032
          318255C868EC43FAA114CF0C6548CA935A586711924165C29492A90023608DE9
          D97F98BB24AAFCA5D6F4A8C8AEEB0273AFD456B4F9935A0B3589B17312ECC6A9
          363C1D0F3B4FC4830D2B13F858FA7B75BD70AFBE57B5C75EC1C65FC241DFEA1A
          E85A5E81B5162130AA0D5AF480E9209326CFF8CB175B6CA3E1392675FB751724
          5576412E2663E6C995A3CDA7C86464225D0D54A3666CE89C325CD93B0C2955DD
          9052DD0D8FB0059480493316CDA4D5EBD0C1B4D432FF64FFB974784F1AEC3F9F
          063F7972A10205DC7A218138A104D26A7BC0D43519ACCF67C081008A743888AB
          7AF9B4119D6D276FB71463E9125F4A20F19504B21A7AA909869DF657B651E545
          B499CC5BA50AC208303CC1E1F1CADF408B5401CD34027C1D632B3A805DDE015C
          AC82105B5887C955E21D139F5F05AB4C5999C4E07014A9EE19661C8DDB6C1FFF
          282CB70E420B5B20AAAC1D92D13084FB0CF638DF8AA004329963008230098C59
          67E2F237CBB35CC5FDEA2E600BC4108DB651A562B851DA0E9125ED10FAB805FC
          788DE079BF01021F36C126EB70C53CBD036BC837D611A4AA7B98713456FF60B4
          8F4358A1CAD83FB31102F3DEC23DA118FEE97B5FBED5FAD2064A242382813E4F
          D8B43FF4A26F7C31702AC410F1B40DC2F8AD1054D0ACF2E3F9A001DC3138B5B7
          F4BF0F8BB7BAB2281BA26B194A2ABB871801DA5F197A2E3770F85D19572E86B3
          3C11F866882028AF19D839B560E69EDC6A60E5BF9132A487509B82DEEB4CF962
          E90C039B1BA2C8A22608C86A5205F5A003BBDDAB070F5CDD6FBF84A53BFC1A75
          A62E98A1B25B63164C5E750D51306D18BFCAEA46ECF1483EB072DE80575A0378
          A78920024B18935B0B963E77E546A739D7BFB709FE010DA6506CB509DA61E8C0
          3E81FBA95FEF72DF67E59B0ABFE5BD010F0CEA86B8DCAD07E7D43AF0C364B6D8
          DE80D9EB6DF731F7015969C22242C910798130FD9C67706CC91A6BCE008B574B
          0547470D2A67D7702EB25E4B201867E2308B8715E182991B170E5DCC80431778
          A06B1E4039FE6CB56960B6EF9DE7D8EFF7819DB8B5E076B70E0E5F2D80B91B9D
          B2E9D7708C2ADE32C300F2BC73089191E712D987615C6CC4B2DC609704E7D21B
          548EDC300B57C40705C59688E1115E54E56219083B65AA8B2BB3AA13BE77E0BC
          F96CA1DEC22F57EDD13338705D7AF1A1089C52EAC0311905706BE0EB1F02A4D3
          161BE9D273A4395BDF999025DBFD494587EC3D288299054467917188BBDEAF49
          E098F012BC1F88C005B371E632D482333AA770C2B33F96D7FB6631E8595EBE8A
          B633177DE776E1606086AAEFAE686778FA16CC5CFD6B00759730D7F8E7EBCF10
          B2ED683C29C7E002A49C464DC484793BCF5B2DB3BC39687E311F3C536BC18B76
          E88241CFA4D4C219CCCE891675ED5133FC702A49B168938DFEC4E9F3672FDDE1
          DF78F65E151C6597C02CDD538D6327CEFA9CBEC4348ADBA464C66A1C9B2D761C
          22104B3F5046A32662FC8CF536CB16985C8B5F6EC551EE0DC88223D1A5702A4E
          08DE28C60BA7FC2447087691A560E6CF834D8762956BCC825CD1EECFB3D6D95A
          ED381603BA7B4360EA929FADA8849857988F023E5DE940C8E6C3379158F2578B
          18B2D81C3163934514E66C32EA9E9FF8E95AEBE5737705BACF330ECF9B6F725D
          38FF4736CCDBC386B9C611C2394661795F6EBFE4316DB5F5723AD03864F21C7D
          A7B4E9CB0FF3703F8919BC692BECC9B41547C8545CFFEB8FFA7F3AE67DA7FB38
          05994A41EF27A9DD0F5A1474401D0A7AAFF931BE961831DAEAA87F8CA833FA6B
          E9A3F1D1BE0B01E00FE5DFFF3B6B594FDCD6290000000049454E44AE426082}
        FileName = 'Images\Actions\Refresh_32x32.png'
        Keywords = 'Actions;Refresh'
      end>
  end
  object cxImageList16: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 8912936
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001F744558745469746C65004865616465723B41646420486561646572
          3B4865616465723B7AC1DA850000022749444154785E6D514D6B1441107D3D78
          F01614C1A3370F8628921C3C6C34BB4442101423F875510964113187DC05F1A4
          82A7A0DE852417316E5C62C4B8AB286AC0C344032144F20376839F1FC9CC7455
          3B5DD5B884B567AABA66AAFBBD57550640746F327E1145519F83832C0738A7B1
          0BEEE2D03EDCADC4585A5B0711D5995D8988B10D8007E92B9FE94258705B9C81
          319AF8F8B989F2702FC6EFD78AA5816E3C9D5950008FE4D7D7D92100043003EC
          65103A062671F3E10A3EAD3541E4B0B8FA0D4962519D7EEFACA59A07007120A4
          148EFD8798C4D1F61D88571BB87AB9880FCB5F906484C2D16E3876785679570A
          0A3241F8B1FE5D2F12830340C7EF063AF7ECC4AD3B7320E2FC720F6AD505892D
          F19C2A20AD77D7D93A3432BA3390E614D72E15A40FFD572690A48434B3E81D3C
          646A9537DA039B919430555D8283D3F273C7B9C9C30E174EEEC7C1BDBB313FF3
          1664E9F9FCE3D760D629200D4D3C35D809A3DD5715610AF0DE18DC1EEDCF7789
          4F84312B005B2B67A79E2C0A9BCFB177B9B16EF8F96B0363C305DC187F8980FA
          0FC064190BD7E9635D9AF19744809E1536A3A0D62AF316004B242C13D3B1328A
          A912EF54C11F8C8D1CF6F5B72900110BDDB9E3072417D85B3D10053A15B2FC9F
          128885E5C1A35819BD4127A1384E7B3072249085D56AA2F6A07CBE47487594BE
          76966FF6AA98A53CE676004AB2CDFAE8F5D9A2F0C921C0E83C019617268C2D4B
          375E01B09AD45A22015233ADFF6D4B3BA3975327F280BFEB5B6B80D529E30700
          00000049454E44AE426082}
        FileName = 'Images\Reports\AddHeader_16x16.png'
        Keywords = 'Reports;AddHeader'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001A744558745469746C650052656D6F76653B4865616465723B44656C
          65746554D176470000026B49444154785E6D914148147118C57F336E5A298A62
          2458E9A261606A4887083313C2A4B2282AF32042A19D3CAC50878C8A223A5497
          20308A20302F9160B151662A6417A30C4C289620C90257125DD1D59DFFFF8B99
          7F43893DE6E3CD1CDEF7DEBC2F80810D582C87E5CED0C103D5EB92531E2C38CE
          8BB3C3EFDAAE9596DD4C126AA28BF1A6BD03AF5F0500FBCEA3913EDBB6AB0401
          C09050BB2B8FF9F321369C3ECCDC58A4E97A5A4653CECE62D20A363277F5DE7D
          2018304E54B59C280196E9D15AF1253F8FA9DE9764976FA1A0BE1A3B36C9CFF0
          732626A37D00DE02A53400D3E123807295A0053BBD909CC6637C68B9C29A1421
          25632DB1892986C3EF276EFD186F037400C0D50B805A425CB19849CAAD2272BB
          8BFC8A6D0492E7897DFDCEEA8C54CAEB2A735B1F0FDE681C1F6BFE93200102B3
          53339E5094468B26CBCE24FAF6139B0E9511191AE5F3B7389BD7DBE46E0DF26B
          76661F609B040A40C8AEEFC7BC590058A229BCDCCE9B731759B5A39C9A8E767A
          431718E8E8894E3ACE194079099C844280AE67A3088216102DB8DD1405F329ED
          E9667A264E6A7A26C1B6761A3AEF1601317F014BA6448ED61663098098140878
          0C599982C6A6A72F02101711C7BF02DA7140A0EBE947CF5904B40888A00D119B
          5B2074AA02472BFCADF8674C2434021CDF5F62FC04C40F8085888065963A8EF0
          2F4C074A21029DDD23C6D11B9304114C827942CD9528676502AF2C104ED69519
          47DFDDEF40C49006E5E8FFFC82D288C0C32723C6D11D40B461444C07CDBB8D99
          8FBF259A0E5A1AB6838039A5858806018D85688D16D07AE502B59888F7B75E0A
          EF11C4083458E69EA0BD074BCC77626961107030E037094B5B9CB6F842E30000
          000049454E44AE426082}
        FileName = 'Images\Reports\DeleteHeader_16x16.png'
        Keywords = 'Reports;DeleteHeader'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002BF49444154785E5D936D4895671CC67FCF73EE736CC636FC30171BA8
          6C6BED4B98CDD186A0D6E8D3823E4C88B941C1060D82B60561A320F7C92F51CC
          6A43652F91E5160C2A5066A3CC4A0B453B6521BD3999387BC11CBE1CCF799EE7
          FEFF77E8B921F0E2E6FA5F5F2E2EFEF77DDDDE0F27D33DBEEFD72A0A000AAAEA
          E473520589A2DE9DDBDEFB50552D0E06A8DDBE6535C05213E0C5D3F191E3D76B
          8004607130D60A004128283154635294F87814247DC2D002243CCF332E418C15
          A714C637AE43DD0A2A82DB84B20B835815C228A0FBBB77F7A7441BA667169BEA
          9A47F71B6B4370A692EE6B40AC214E56C08A100496D7E73A79BBA2A4A164D301
          EEFEFED5B747FE99F38DB5008A88D2DE997E36AD282A8AE743F9AAD7585556C4
          F4C04F54BD759B924D8790F1833C1DB94F6E2ED760A2D0A22EB5FEA335F10AC4
          101172B91C53FD6D142E9EA7ECE36682D126067EB908AFAE606A7AF29009DC25
          0A1E63D515A8022649D1173B486DAEE3E1D53696CF9FE7CD4F8EB230D4C8D0F1
          CBD8575670F658FAFBE65BF3FB8C4411288828A5178741C15ACD2767F9B7AF85
          C2FFBA59B9B595994B7B489FBA465054CC99F69B875BEE64F601593F74CF27AA
          B49CE8A7F5B77E6E8C4E30F1F73DC2FB7FF14EDEFCA8EB6B863BFA5978A18853
          1DB75BF2E6BD40E6D3622326B21655B0029F6F791F55C8E6D37F6E4F53F9F27A
          72938F193933CC6CEA45CEDD7A835FC76E36020BE31D1B65F78E0BF871911451
          E5E8B15E5A4F5C21084206D20F285DBD963F4E9E66F05E014F966D80F27A80CC
          DDB66A09E6B384563079C295872F3FAB0194D9B959AEF69CA36EA48FAA0FCAD9
          BCEB472A2A2BB971B80F40767D73392E9B0746224181E5CB8CABAD62122F911E
          E840AC605205244D123F615CC120B44A32E1B1B23885C985D99E9D8D5DEB5DEF
          1101CF53001010C053670C167B81E8CF8CE28007A400E3346E2E85FB964440A0
          AA82C3FFBE9095D49CDC69840000000049454E44AE426082}
        FileName = 'Images\RichEdit\TrackingChanges_TrackChanges_16x16.png'
        Keywords = 'RichEdit;TrackingChanges;TrackChanges'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001AE49444154785E75534B4AF44010AEEACCA8E01DD40B08BA101F0B67
          44044170233222FEE063A1AB39834B0F200AE24A656EE00F2E7C0C2E14041D2F
          20DE424DBAABEDAAEEE904126BD25D9554D5575F7F93A0B51610519D747AB74A
          A9A6050B6CEC3817C2B8F123D2BADBDE9E5A747953036FE85673BF35CE71A9C9
          A773B0E3CBB78673895B39803124419A512865067EE39FBF1006EB0AB4A6FE50
          E80380218F4E6EFB5C9A9666CBCD441C8B8DDDBD00C31B329169814116CF3D72
          F32CC95C030CE0AC01FEC1C0F852220B57D73DF1453364E1DFEAA4B0D1BA8281
          CE0CD830757365420A732DACCF91D725CB2A18A4414402848F793FC992174664
          240B638FEFC2449B320320ADB952A88F3EBC86985DA082C24496265362808E56
          14EAACF304A858178A939442D8599F95BCD6B64203638436F7ECB566A206E8BC
          C0040D886B749941986665C2E945176A49026996AB3D504F6077630E2C290740
          154730145F9E83AD8680D9E2BB60955B240364585944AFC1F0502D2A4F16A549
          04058C47202A03989FECFBBE7DF87FA1AF3AD720DA802E17606093A55F5DE774
          11409F1FAD2D877B8C5F68C924674373CA895F0C703C351927401F0000000049
          454E44AE426082}
        FileName = 'Images\RichEdit\TrackingChanges_ShowMarkup_16x16.png'
        Keywords = 'RichEdit;TrackingChanges;ShowMarkup'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001C744558745469746C65005461626C6550726F706572746965733B54
          61626C653BE8BCC9780000028B49444154785E7D536D485351187EEEDDDD1659
          DB8A28CA4A42D13EA42242A1B2C2C04C8AE85F100446118A5056F4CB3FD1AF12
          2C0A414D34FB02354A08A33233675FA666E5B048932DC5A9B9DCD6C6E6EEEE79
          BBF7E4F426D803CF79795FCEF39EE73D9C23E495F58211815456E4A7620E083A
          8A872BB7151A4CC2210212244D5C9EB741D46D802E8A2F8B4F1CB0C6CDAB5714
          068D11398AB7811118B7C663CB9A54F08EC7AF7F6A2608BB1923288C6199D588
          B4641BA2C30EACF8D5861DFBF7829408143982483804DFC4042E74DF46D2C644
          480004A68AB3D2578111B0D02C62E52203BCFD5D10C65B9191BD1DD18007635D
          76CCB799110E0410F4FBB0DE1B85BDC7016E9D18E362CDC192380163BD1DC0D7
          46EC54C52FEA1E6072B807D6E44DF00C8E223A1984228760F501038343BC01BF
          C4BE1F3F6193C218ECB6C3D8FF18892909B8537205E96909B0B7F420E8EC842D
          79337C235EB806DCE8E813E1F705A1C178FE96833484C361BA5970905C4DA554
          7EE608B536DCA38ADC741AA92FA087E772A8A928932EEE5B4B978FE5504D6337
          018897A081682A10BFA8BAFB2D38595C055114A1280AEA6A2F615DD252740D99
          907BE3392C160BEEBE7603805F8A8DF0A87314AB179B907ABA1A82007C7085E0
          09C8589EB2070B76FD46DBAB0664145EC3977103BE3B3CE8FCE6450CA6B3D59F
          498F9A16D774A23AE0A335BE77922CCB1443EED57704C022C6ACEBC166723E86
          D96CC690972049DCB07EEAA9774084867637FC21195CABB2BAD905C69B69295F
          50F6CCC90F23028FB1176B3E55F991F4A86A76D26C943D1D203D8E96BC210056
          51E767B6BDFFD768E6D318F34BDB9F889294A9306E6DC6262330A8D4EA88D518
          D7464281B6DAA2AC6C21D6048061D6B7C5DC91430610FE03D322A31F5383B2DB
          0000000049454E44AE426082}
        FileName = 'Images\RichEdit\TableProperties_16x16.png'
        Keywords = 'RichEdit;TableProperties'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000027744558745469746C6500526566726573683B5265706561743B4261
          72733B526962626F6E3B52656C6F6164CD4DF6E90000030249444154785EA593
          6D4C926B18C76F018114A40D6D619DE98433AAE3F16D7CB173AC43666FE69C7A
          D4F48825339D4E6136D314EB2C23B46C332B957484A0522E5B6E2C31B537B437
          319BCECC17B2652D672FC715E03194AEEE875A6BB53E796DBFDDCF7EF7FFFFE1
          DAB3DB0500D052C6E5A7FEC73B70F2FDC89A4D48D664FA5A5AF5DB1FE4E8928B
          E2226D9F11FB0F04459A7B3D052A63DE0E71B11B91C10E77FA9D5D94DF70DF59
          4E93EB7EC957DF1B4F935FE009B3EBB7A59FE8704C59E6E185E503DC9D7C0B9A
          5B66D8A7BA33243AD4E087F3A4E9F98F683FD1959EBD8BF0B8E6D418BB1F3C9B
          855DA57A23871BC00C15D755FD99D508E1521DE49EB90E833356B8D4F71C726A
          7A460285F11EC48A92CF5D44D973CC50A8BDF504C6FE7780F2CA3044481AFEF5
          FE3598C1DD24F5E10A73F88109958A8DD94DF69E171638D53E0AA2A36D07885E
          E6E95E8476E6D5090AD57D0B66DB02F45B1661DC6A87B4B2F685E0D8C3422284
          21619605FC5DA148ADE884F303D3905C6630112EF5C40D449AB550D5BDBDA314
          D9C99BC862B52379ED6DF478E215C595B9AAFE4B9918D2CC4857CBE4F834A22D
          672287831C881D4B9B2F74232EE918CFA81283FDDA4B1B241CE9062F7E441076
          0C0C19438B2CD63F8A3AD8017187BB4033F61E88EFA8920E882CD24F92F8D1D5
          F3383467B3D846269EFE877CBC5928707372CAB7FFFFF9F01D890783BE98951E
          8628542ACACDDC88ACAF5E3B4C8656090ACBBD4C846802514DE9DEDAFBD038F4
          06E28F742F083395C7F91B44416BFEDACDA731BD38214995E519AA01A837CF41
          A2A213BC422455B8C744828C56E78E8C956B3921E226739666109A47DE81E4DC
          0024286E424CE935F83DA95A87337E41A92A93ECEA14B043F63F2451591CE78A
          01BB5B50DB14B105725D199C28F0FF47FD24EEF86D28D19B4139340BCAC15908
          2F6807DFF042317BCD9650FF14ED33EA8AB0F5384F65AC2B40889FD48CD1394F
          42D2D9BCD53E5BE515BC98DA21EC017BE0C52A877DB797CBC8547716CE786068
          74AE1411E0F90132C61DC3C67030DE18CF2F8EFC7D78C9CFF9136643522887EA
          10230000000049454E44AE426082}
        FileName = 'Images\Actions\Refresh_16x16.png'
        Keywords = 'Actions;Refresh'
      end>
  end
end
