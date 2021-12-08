# frozen_string_literal: true

TEST_INPUT = [
  [%w[be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb], %w[fdgacbe cefdb cefbgd gcbe]],
  [%w[edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec], %w[fcgedb cgb dgebacf gc]],
  [%w[fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef], %w[cg cg fdcagb cbg]],
  [%w[fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega], %w[efabcd cedba gadfec cb]],
  [%w[aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga], %w[gecf egdcabf bgf bfgea]],
  [%w[fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf], %w[gebdcfa ecba ca fadegcb]],
  [%w[dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf], %w[cefg dcbef fcge gbcadfe]],
  [%w[bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd], %w[ed bcgafe cdgba cbgef]],
  [%w[egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg], %w[gbdfcae bgc cg cgb]],
  [%w[gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc], %w[fgae cfgab fg bagce]]
].freeze

INPUT = [
  [%w[cefbd dcg dcfgbae bdeafg gfcaed ecbgd bcag bdacge cg bedag], %w[cebdg egcfda gdacbe badefg]],
  [%w[aefgc bcdgef bef bdegca bdeca fdab afcbe fcebgda bf bfaecd], %w[fgdecab gefac fgaec bdaf]],
  [%w[cbgedf beda cfgbea cafbed cdb afcbe bd gbaedcf bfacd gfacd], %w[acdefb cdfeab dfcaeb abde]],
  [%w[efbag de adcgf fgcdea gfdabc daec fdcgbe edg fgead acbgdfe], %w[de bgfae decafbg gefabcd]],
  [%w[bfg gabecd gf facgb cafgbd acebf degcfb bagedfc gdabc gfad], %w[daecbg gabcde cfgdbe bgcfa]],
  [%w[gbaf dbfgac dfeacbg fg gcf cdfab cbefad dbcfg faegdc gbdce], %w[aecgfd efadcb bcdeaf cdbaf]],
  [%w[dgc gbfde aebdgf gecfd cd gecdbaf cfgedb dbgafc efagc decb], %w[gebdf cd fcage dabcfeg]],
  [%w[dbfeg debfcga ecg gfbaec eadfgc ebac gbadfc ce ecfgb acgbf], %w[dabfecg abegfc dcbgaf cfgab]],
  [%w[gbadefc dbegac bcadef gabcf gd gfbdc gefd fedbc dgb bedgfc], %w[cbdgf bfacde cdgbafe edfg]],
  [%w[edbac fbaedg aedcg acg gdcf fbcedag afedgc acbfeg gc fdaeg], %w[dafge adceg cbeda dcbae]],
  [%w[gbcfe fgebdac cefab gdfcb efg aegdfb bgadcf gdec ge gecdfb], %w[aecfb egcd fecab bcfdga]],
  [%w[gbd ecbfga gbedcaf bgedca bdgac baegc dg cedbfg dfbca geda], %w[cdbaeg dgaceb gade bfcad]],
  [%w[cefab agf faceg agced gf fgabedc gacdbe dabfgc ecgfda edfg], %w[gdeac fgadcb afg agcfdb]],
  [%w[bagd ecfagb ag gaebdf acdfeb abefd edfgacb fcegd dgefa eag], %w[afdge egfdc abefd dfaeb]],
  [%w[gdcaf ebafdg fdcbeg dbgce aecb adcge adcgbe gea ea afgbdec], %w[efdgbc egacdbf egcbd bedacg]],
  [%w[gafcd bedcf ab cfdbeag eafb dfbac decfgb dgbeac cedfab acb], %w[abc cba ebgcad fcdageb]],
  [%w[dceagb edfa af bfa acfdbg faegb gbade ecfbg eafdgb cebadgf], %w[degcbfa af bgdecfa aegbf]],
  [%w[efcabgd gfbead gbcefa egabf bcgea gc badce fagcbd acg fgce], %w[bfgeca gca bgcae bafcgd]],
  [%w[afcgd gafecdb ea befcg egda gbfdac eaf caefbd cadegf faceg], %w[aegd fecbg gdea fcgdab]],
  [%w[gcbd cag gbcfae bfdcea cg acgfd bgadcfe aefdg fabcd bdcgfa], %w[dabcf dbgc bcdg gc]],
  [%w[cedgbaf ae afe gdfec cdbfa dfaec faebgc bdea bgfdac cfdeab], %w[begcdaf ecfgba ae ae]],
  [%w[bfea adcbge feacd bcfeagd af gcfde caebd acbedf afd dfgcab], %w[aebf becad dfa fcegd]],
  [%w[dagef acdgf ecad ea gfedb gea cdgafe acegbf dgfacb aecgdbf], %w[cagfd dfabgc gfbed ae]],
  [%w[fced bgfcad ecb cafbde afbcegd abdce dcafb ec gadbe cfegab], %w[afgcbe ec cfegab bcdfa]],
  [%w[afedbg bda gfbcade ebfdg dbacef badeg fecgdb agfb agecd ba], %w[ecdag gcbedf fdgeb gfdeb]],
  [%w[becdfg ac dcgef aegcfd gadc eabfg afegc dgefcba eac adbcef], %w[bcfgde ca facge fbgea]],
  [%w[dafg abegfd defgcab df abegcd eafcdb edf gedbf dageb egfbc], %w[agfdbe df agefdcb dfebg]],
  [%w[fcea cbe bdfeac edfgba deafb edfgabc adbec efdcgb bagcd ce], %w[bfegda baedf dagbc cbeafd]],
  [%w[bfdec abefgc gb gfbd gbced fbdecg gedfbac ecgad cbg bcfaed], %w[fedcb bdecg efdcgb dceagbf]],
  [%w[cgabe gafc bcegaf bfcaegd begfda agedcb gf gefbc bcdfe bfg], %w[gcaf bedacg becdga bfg]],
  [%w[gebdfac cbga fadebc fcgdab ag gbdfa dbafc agd bdefg egcdfa], %w[abdfc bfadce abcfd abcgfed]],
  [%w[caefd fgabed acefdg gbcfe gdac dcfge ecfabd cdebgfa gd gdf], %w[cdga gedfca defagc ebfcg]],
  [%w[efagc cdf df cfdae dgbfca egadfc gdfe dabce gacefb cfbdega], %w[cbefag ceadb dabfegc cbdea]],
  [%w[edfca eacdgf aefbc ced faedbg gfead dgac fgabdec dfgceb cd], %w[edbafg dcag dec dagc]],
  [%w[fgcbade ecfdg efcbad aefdc deabc bgaced gafecb fa bfda efa], %w[eabcgdf af dceabf bdfcea]],
  [%w[gfabd abg ab gefdb gfabdce cdebfg dabecg bagfed dacgf fbea], %w[ba bga fdacg dgbeca]],
  [%w[ec dcgfa gcdeba efgcd dce dcegbf gbefd bfce dbgafce bgdeaf], %w[cefb agedcb cegdf ecd]],
  [%w[cde daecbg dbeafc dacbgf fegcb dfecb ed gbcaefd dacfb dfea], %w[edfbac ed ecd eagbdc]],
  [%w[gcbfdae cbdg dbgfe febad befcg dbgfec fcbaeg deg fedcga gd], %w[adfeb ebgcf cedfga gadbcef]],
  [%w[fceba dgefac aedb befadc dafcbge fbced gfabec gbfdc ed dfe], %w[gcefba bade bfgdc cebdfa]],
  [%w[bef fabg fb feabd cgadbe cgdfbe ecdaf dbfgea adgbe ecbgfad], %w[gcdbae ecadf adgbe eadgbc]],
  [%w[fcagb cefbga aebgcd eadgcf bfge gcefa fadebgc gbc afcdb gb], %w[agbedc febcag gfbecda fcabd]],
  [%w[dfgeca gfceba gd gcaeb gdc bdga dgbaec ecdgb dgfcbae dbefc], %w[bacgef gcefba afcged cdgefab]],
  [%w[edafg feagdb dgacefb dae bfgedc abfedc ad fbedg cgeaf bgda], %w[gfbeda fcaeg dgba abgd]],
  [%w[ad cadf dcabe fegbac gfadbe bdecfa gbdaefc dgecb feabc abd], %w[fegdba cadf gdbeaf fcgbea]],
  [%w[badfg dfeacg dfeag dbf bfecgd bf dacgb agdbcef gfaebd ebfa], %w[fb gdbca agdbc fdbgae]],
  [%w[gcbfda fa faeb efdac bacefd dbcfeag gedfcb fedcb afd gecda], %w[feab gcfdba gaecd abcdef]],
  [%w[da acegfdb acfgb gade abgdf cedfba fgbdec gedafb bad bfedg], %w[eabfcd bfcdeg deafcb cbfedg]],
  [%w[gcfdb dcea gadef gfdace bdgfeca fcbaeg agbedf ca acf cdfag], %w[cgfad feagbd badgfe egfadc]],
  [%w[cdgfba bfeadg gbca fadbg fcaed gdbface dgacf cg cgd dbgefc], %w[gdafb cfeda cgab gbdfa]],
  [%w[cbdeg bcda cag ca fegba gfdecb agdcfe cebdgfa cebga gbcead], %w[gecab cdfbage gfeba gcabde]],
  [%w[agfbc dage edbcfg dg bgd acedbfg dcagb bcafed edabc degcba], %w[bgd gacdb gabedcf agebdfc]],
  [%w[gd gdeb cbafed dgecfab faged fcdgab fgebda cfgae gdf beafd], %w[acefg bdfeag feadgb cgaef]],
  [%w[cadbfe acgbd ecfa fagbdec dgfabe cbade eafbd fbedgc ec bec], %w[dbfgcea fcebdg bacde dbeafc]],
  [%w[eaf eafdg afgdc cgef abcgdef dfgcae dgabe fe fbcaed dgfcab], %w[bfgcad egfda gcef eaf]],
  [%w[cdbgafe efb eagfcd cfgbe cbdefa cfgba dgbe be gcfed befdgc], %w[eb fgdec dcafeb adfebc]],
  [%w[gafcd ceba abedg aegdbf cfgedb adcge edc fagdcbe bcegad ec], %w[ceagd dagbfce ce cde]],
  [%w[acegdb fe adgcfe efgc gbcedaf dafbc gacde fcdae dgabef aef], %w[geabdc eagdc fdebag bgeafd]],
  [%w[fgdba ebfdg gfe gfeacbd fe eafb degacf gecdb bfegad fbgadc], %w[bfcdag cdgbaf afdgbe adfbge]],
  [%w[bagdfe edcfgba gbcea ecdgbf ebcfg gef dbfcga fe fced cfgdb], %w[ecfd bcfeg gdcbf cfabged]],
  [%w[fgacde egdbf ecf fc dbgefa gdfcbe bgeac cbfd dagcebf cfgbe], %w[degfb gdbef bafcged egdafc]],
  [%w[ed eda cgdafe cgdbea efacgdb gdbe eacfb acebd gcabd fdgbca], %w[adbgc bcgad gdabc gacdb]],
  [%w[cgbdf bcd cd fcad bfcag cfbdega begdac dbagcf dbgfe aebgcf], %w[cfgba dgcfb cbdgf gcbefa]],
  [%w[bd gfbdeac cdegf bdc cgefda gbfd fecdab dgcbe cgeba dcbgef], %w[cbd db db gdecf]],
  [%w[dgfcaeb adebcg ecdag fadc afe eagfc bgfce af edgcaf afegbd], %w[gdcaefb fa cdaf eacdg]],
  [%w[ebdfa bae be dfecabg fagdcb dfgab aegbfc dbeg cfdea dabfge], %w[fdagb adbgefc bae fgbdac]],
  [%w[cefb agfedc ebcfgad fgadbe edgbc be bed dfgce cedfgb dcbag], %w[be faecgd gcbda eb]],
  [%w[gaed dbefcga dbgce ag abfce gfacbd adgbec dgfecb gceab agb], %w[debcga gedfcab aged dcbge]],
  [%w[dbfceg abcgde gcabd dabfg geabfcd cg egca ecdab dgc abcdef], %w[bdcefg fbgcaed cdg gc]],
  [%w[gf bcegd fbg dacfbe afcdb gfda efgacb bgfcda fdcgb fbedacg], %w[bcfda bedcg gbf fdceab]],
  [%w[cfgbe gdcebaf fbcdeg bdfga edf fcedab dfgbe de cedg gebfca], %w[abgcdef befgd fed fedbgca]],
  [%w[fbdac bafgcd eb cbfged bec cdefab dcefabg deab fbaec fcage], %w[cfeba bgcefd ebc bce]],
  [%w[dab ebaf afgde cdfabg debga dcebg fgacde ba bcdafge efdbag], %w[ba bagde dgaef gebcd]],
  [%w[dbacf ad dgcfb caefdb daf deab fegcda bafdceg efcab fgacbe], %w[deba egcdfba afd ad]],
  [%w[bfega dabegcf egafd becgdf gbaced bgcfe afgbec ab cbfa gba], %w[abegf defga fabcge cabf]],
  [%w[bfecg fd abdgc gfbacd afdb dgf cgeabd aebfcgd gdfeac cdbgf], %w[bcfdg agcdb cdgaeb eacdbg]],
  [%w[fea dgefca gacbfd dcfae afbedg dbcef dbefgca gafdc ae aegc], %w[afced efa egac ea]],
  [%w[aegc gdcaef bfgcda acd cegbfd ac decgf gfecdab efadb fcead], %w[cadef cfgde agcfbd dfeagc]],
  [%w[bafcgd ce bdcage fbdeg ebgdc ecba ceg cedgaf edcagfb bdcga], %w[cbae cbgefda gceabfd cafedg]],
  [%w[bac ca bfgcda aecfdgb egbfca cdbef abcdf gefadb fbdga agdc], %w[dcbfe cagd dfabc dcag]],
  [%w[agdcbe cdagb dec de gbed bfadegc afcbe fagcbd dceab cgedaf], %w[ecd ed gbacd dafgebc]],
  [%w[dfgbeca fgdeb dcefga af cgaf eabdgc afgde cedafb adf gacde], %w[edcbfa cadfgbe gdfebac af]],
  [%w[fba dcbgeaf agecfb gabde eacf fa cgbdaf aegfb gefcbd ecbfg], %w[fegcba bgeaf gbaed bagfe]],
  [%w[bd afgdc gebcf gbeacd cadbgf caefgd afdb bdg fdbcg cadgefb], %w[fbdgc cgebf agbfcd cbgdf]],
  [%w[fcgbdea dcbgaf cgfde ebcadf gcfaeb gcfeb ceafb gbea bg cgb], %w[cbg cefgd fgdabc feabdc]],
  [%w[ac cefgba gabc fbcea caf bafed bgcfe dbegcf cbaedfg fdacge], %w[ca dcbfeg fbgce bacg]],
  [%w[agfbdce gcb gc abdefc badgfc cega egbfd efacb bcafge fbgec], %w[cbefa cabgfd afcebg ebgcf]],
  [%w[cbga adcef cbgdfa dab dfbcg ebdgcf aegdfb ba fcbad aegfcbd], %w[eadbfg bcga cafbgd bfdgec]],
  [%w[gedfac dfeag gfdb cabgefd gaefdb bfgae fba eacbg deacfb fb], %w[bf afb abgce egbfa]],
  [%w[ebdfg gaefcb de dgeacb gafeb bgfdc deb egcbafd edfa gbfdea], %w[bafeg ed fgcbd bfadcge]],
  [%w[dagfc ecg cafdgb bdeac cdfgae dfgceab degca gdcebf eg gfea], %w[cgdfabe afecdg decga gcbadf]],
  [%w[agf ebfcgd cefgab ga cedfbag fdcbg dcefa cfgad gcbfda gbad], %w[abegcdf agbecf gbad bcgfd]],
  [%w[cfabdg da abfd gcaef fdgac dga dbfcg cbeagd bdecfg becdgaf], %w[fbad gdcfa gfdca gcbdf]],
  [%w[egad dg ebacg gcfeba adcgfb becgd dfceb ecfbdga gcd egbdca], %w[dg gabce gbecda gacedb]],
  [%w[fgbdec eca cabd gfeadc ac afgbe degbc fecbagd gbadce gcabe], %w[eac dabc bcadeg efabg]],
  [%w[fd bdegc dcabge dcefga decbfg cdfb degbf egfba edbcgfa dfg], %w[fdg gdf gbecd bdgfce]],
  [%w[fcebd efdbgc degabc fegad gb cadbegf bgdfe bfgc eacbdf egb], %w[agdfe afdge bge cbaedg]],
  [%w[fdgc bdeac abcgef dfbega daegc gca dafeg gcfbdae gc cfeadg], %w[cag agc begcadf gfbeca]],
  [%w[gfabcd edafc acegbd fabdc dacbg badgcfe fb bfgc baf fadbeg], %w[adcbf gafedb fba acbfd]],
  [%w[bgdec acfbe cfeagbd efcbd faebgc fbdeca dfc adfb cgfade fd], %w[fdc afegcd ebcgfda fd]],
  [%w[gcebf bdfgca de cedbg ecgfad dbcaeg agcdb gbfceda eadb gde], %w[dbgce bade abgdce dbgec]],
  [%w[gfbdcae bac ca gfabe cfdbag agec edfgba efdcb acbef gbcefa], %w[gcbfad fcaegb ac fgcbad]],
  [%w[gadebfc cedbga bfad dgebaf cfgeb dfeag bgdef acedgf bd bed], %w[degbf eafdgc edb db]],
  [%w[bdgca gfbca ebcfdg cdea gafdbe cdb cd agebdc aebcdgf deabg], %w[edbag bdaeg dcefgab adec]],
  [%w[cedaf fbdaeg cgaef bceagf dfgeacb cbga agf ga ecfgb dbcgfe], %w[dafbeg ag fegbcd dbgceaf]],
  [%w[abgcd aefcdg fab eadfg ecbgfa fgbda aedfbgc bfed bf dgfeba], %w[bfa fgaed bceagf agdef]],
  [%w[aecb bfa afgedcb befgdc ba efdbc bgcafd cdfeab aebfd fdeag], %w[fab ba fba efbadc]],
  [%w[cbgedf gdebc cebgfda gdeca cdgeab adcb eagdf cea ca bfaecg], %w[dcgea fbegac dabc acefbg]],
  [%w[fgc bcag cdbgf gedcaf ebgdaf gbdfa cedfb cg bdagfc fgbcaed], %w[fgcbda gdcfba cdebf gcbfd]],
  [%w[cafdgbe fecga cfgdbe gf eafdc gbcea fge gbaf acgbde gcbfea], %w[efdac gfaec agbec bedgfac]],
  [%w[bace egdafc eb bdecfag gbcfd daebfg gedca geb edcbg edgcab], %w[gedcb eb fedbga bgcde]],
  [%w[bgdcf cfdgabe dafgb gfc bacg bdcef cg cfedga fbegda abgfdc], %w[afgebd fagdb fdaecgb cg]],
  [%w[gacde bcgfaed fbcde ebfdgc dfba adecbf gcbaef adcfe caf fa], %w[adfb ebdfc daebfgc fecdba]],
  [%w[gbeac dgbaefc caegfd gd cgfd edg aedcg befdac fcade dbagef], %w[daebgf gadcfe ged dg]],
  [%w[bcfdg bfecag efcdg fagedb adce dacbgef gcedaf ed efd egfac], %w[aecd abecfg cedgf efgbda]],
  [%w[acdfg cfebdag cfegba cga gfbda ac cfbgda cdegf fegdba bcad], %w[acfdg fagdecb fedgc ca]],
  [%w[aeb fcbagd gafebd be efcda degbca edfgcab dbaef gfadb bfge], %w[dcabge aeb be adbegc]],
  [%w[gbfdaec gafedc gadcfb efdcba acfbe ef caebg cfe dfeb bacfd], %w[afebcd cabef cfbda ef]],
  [%w[aegcf dagbe bf fabedg bafd feb fdbceag gafbe edfcgb egcadb], %w[eabfg fgace bgade dbaf]],
  [%w[fedbagc afgcb dc fbdcg bdegaf edcb cdf begdf edfgca gfcbed], %w[dbec gbcfa dc cgabf]],
  [%w[gcfade dg fbecgda bcdef gbfd gdbec abdefc cgeab gbfcde deg], %w[cdeafbg gd bfgdcea dafbec]],
  [%w[fdega cfgab adc cbegad cbfgaed gfaced fdec abdegf agcdf dc], %w[cagbed dgabce dcefga fgcad]],
  [%w[bf bfadc bfga gfcda bfc afdgbce cfdbge bgacfd efagcd cdaeb], %w[dcabe fb gacfed edacb]],
  [%w[deba badcf gbdcaf bfdce ecdfg bec efcgbda cgebfa be aebcfd], %w[eb adbgcef cfadb dfecg]],
  [%w[eadcfgb gf eadcf dagfe gfab bgefdc egdba dfg eagbfd egdbca], %w[aecbdg edfag efadc adegb]],
  [%w[cegabd gaedc gceabfd degabf agfceb acdgf adgeb debc ce gec], %w[eagbfc cge ce agcfd]],
  [%w[cfdabg fcead agfedb ba fbcgd fcgedb gfbdcea dbfca cgba adb], %w[gefdba bafgdc dceaf ab]],
  [%w[degbf bcd agcfbd bgeafc fdca aebdcg cgbfd fagcb dc cfgbeda], %w[fcad adgcfb cd dbegf]],
  [%w[dagbc eabcdf abgcefd bdagef faec beafd ebadc gdfcbe cbe ce], %w[cadbg adcgb gbdefc ec]],
  [%w[eadf fcbga edgfacb cfbdeg fagdb abgde cgbdae dfb df fgdeba], %w[feadgbc egdba df gecadb]],
  [%w[eacf dgecb bcfda fbgdea gbfdac fcdabe dfe cfebd ef bgfcdea], %w[aecfgbd fde cadefb ecgfdba]],
  [%w[bdecag cfdaeg cbafg gbafed bedf gabdf fedag db adefgcb dab], %w[fegadc efcgad feadg fedb]],
  [%w[fdegca facge dcfe ec eca fagde gafcb egcadb gfdaebc gdaefb], %w[eac acgbf dgafeb fbagc]],
  [%w[cbfdea bg gbea egbfcad fdecbg eabcf acbgef fgbca fgb afcdg], %w[ecbdaf cfabe abcgf bega]],
  [%w[fegcd cagbe edafcg fgbced dfeabg bd bcdeg bdcf bed agcebdf], %w[ecfgd cgedf gcabe fegdba]],
  [%w[ec eafgbd aefdc cgae fadcb bgdefc gbcdfea ced cdfega efagd], %w[ecga ce dfgceb bacfd]],
  [%w[decfa efc fgdaecb cbgfad ebca ce cbafd adbcfe afged ebgdfc], %w[cbfgad cfabd bcae cgafdb]],
  [%w[cbdgfe egafcdb gbadce fc decgfa bfceg gcf dbfc cgedb febag], %w[cf cfgeb gfbedc gbdefc]],
  [%w[gface gabd fdceba cgdfbe bfg cbgdfea fbcagd gb abfgc cbfda], %w[bdcgfe cfgbde abcfd gcbfdea]],
  [%w[fadgbe gdafb daef bae bacfgd gecdb gebfca gebda ea eacgdbf], %w[ebdfag bfgda agbde ae]],
  [%w[ec bacdegf dbacg cdeb fageb cea abecg bdacfg dacebg dafegc], %w[bgdacef gacefd ebgaf acgdfb]],
  [%w[dgbfe gb ebafdc bgd daecfgb aedfb dfegc ageb fadgeb gafdcb], %w[fgaedb dgfce fbegd facdgb]],
  [%w[egcfd acdefb fgea fbdagc efacd aefdcg bdfaecg fg fdg ecdgb], %w[aedcbf fgd cedaf gf]],
  [%w[fdcbge dfbe cgdea db gbfce gcdbfa agecbdf bgcde abgefc bgd], %w[dagfcb efbdgc ecgfb febd]],
  [%w[geadcb afgbdc cfd cedgf ebgfcd bgfaedc dbceg fd bdfe ceagf], %w[fd dagebc edcgb fd]],
  [%w[fdeabc eg cedbag fgbadce agefc cbfgae ceg ceabf gdacf fbge], %w[egbf gec ge ge]],
  [%w[ebcgd ebc efcagb cbaged fdecgab dgfeab ec dgbcf degab cdae], %w[cgebd gdafecb afcebg cbegd]],
  [%w[bcdafg cfdea edg dcefgb egdcfba gbdfc gcbe eg gedcf bagfed], %w[bfadegc fgbdc cefgd cfdgb]],
  [%w[edcab gcabefd dg cbagdf gbedc cdg fgecb cadbfe gdea cebadg], %w[aged gcfbe gdc dbgfeac]],
  [%w[acgedf cbfadg ebafdg fcged cdg cefbg eadc dgfae cd dbfegac], %w[fgecb bfacgd gbecf fcbdag]],
  [%w[ecfda cbgfeda dg ebfcdg aegfbc bcgae egdac abgd gde gadcbe], %w[gcbae efdgbc gabdce dg]],
  [%w[gbfecda gbd dg cadg egcfbd eabgf ebcfad gbdcaf fbdga badcf], %w[dbg abfge fcdgbe ebgfa]],
  [%w[aegcf dgaefc abdfcg fdce abcdge bfdcgea fcg feabg gaecd fc], %w[fgc cdebag fecd cfde]],
  [%w[gbcfae ecgadb ecg edag gbdca decbg eg bfecd cbdagf edcfagb], %w[gbcadf ge afdgbc gecdba]],
  [%w[dec caegdbf deacgf dfcea gadc gefcba bedaf dc febcgd gcafe], %w[dcagbef dc eafgdc cfdebg]],
  [%w[dafebg gfced fgcdabe bagdec eafbcg ebc dbac agedb cb bcdge], %w[egacfb ecgfd edcbg cb]],
  [%w[gcd dfbcag gbaefd agfdb dc abcegd cfega ebcadfg dgcaf cdfb], %w[fabgdc gbedac agdefb bcadfg]],
  [%w[dcgaefb dcebg cb bdeag afdcge cfeb cdgef bcd dcgbfa dcbgfe], %w[fecgad befgdc efcb eadgb]],
  [%w[agc aefgcd ag dfaebgc edcbfa cbagd gbfa abfdc decgb dcfagb], %w[gabdc cga dgfcba bgadcf]],
  [%w[bde beca gcafdb bdecg fdgeabc aedgbc dbcag dfceg gbfade eb], %w[bcae agdcbf fcgde ecdbg]],
  [%w[gbacdef bf fab cbdf fdacbg bcdga bdcaeg gfabd fabecg egdfa], %w[bf gcbeaf dcabg becdag]],
  [%w[bf ecgbdf cfgdeab dgfb cfedba cbagde feb fceag decbg gbcef], %w[ebdgc fbgd cgedab dacfeb]],
  [%w[eabdcg efdgbca abegc bf efab cfged afcdbg fgebc gbf agfcbe], %w[ebcag ecgabd baedcg gbcfea]],
  [%w[efcgd afbgec bdfgca adgef eabd ae gfadbe gae fgbda bdafgec], %w[fadgcb bgaecf eag gfdea]],
  [%w[cafb dcbage gfecd dafec ac cdgbfae badfeg afecdb cae adefb], %w[ebacfd badgfe ceadf dbgcea]],
  [%w[deagb dfebcg deagf dagcbe fcdgeab bafg daecf gdeafb dfg fg], %w[gf fedgba gdbae fgd]],
  [%w[gbcfd ecfbdg eadcbg ceb agdfcb fdceb ce ecfg daebf aedgcbf], %w[egcdbf fadbe ec abcdeg]],
  [%w[fbgca gadefb egbfd ecdgbf afgeb ea adbe fgdaebc fea agdecf], %w[ae becdgf eaf agefb]],
  [%w[gfcabd dabgf gfbcd fegacbd fcab bcd daebfg cgabde fdgce bc], %w[bcfdg efdbga adefgb bgdcfa]],
  [%w[dcbagfe ebgdac cabfeg gf egacb aefg cebfd cgbfe cbadgf gcf], %w[aegf ebfdc bdgcfa gf]],
  [%w[befcdg bef fcdb gcfae gfecb agdecb fb daegbf bfdgcea begcd], %w[bf fgace cgebd dbgce]],
  [%w[acfebg fdceg efcab bcd dabe cbafde gbcdaf db agfbedc cdefb], %w[abde cefgd cdb fecbd]],
  [%w[agc ac afged dfbcg fbgedca eacf gdbace dfcga agfdce aegdbf], %w[gcabedf fecgad agfde gdefba]],
  [%w[dfc gdce dc bdegfc debfg gceabdf bafged efcdb gbdfca ebcfa], %w[fbcegd bcgdaf fbedc bfcde]],
  [%w[cbedf baged adfeb bgeacd gebafd bfa afdg af gcfedba gfacbe], %w[edbaf fabed gbedcfa fadgbe]],
  [%w[gabe debfa cgdbfe adfge dfgcea beagfd abcfd be abgfdce dbe], %w[fdacb eb fcegdb egfbcd]],
  [%w[dceag dacfbg gcbae bfae becfg gcdbfe bacfedg ecfagb bag ab], %w[bgeac eacfbg efagbc egfbc]],
  [%w[ebcdfa dcebg eab bafcedg cadgfb ae fabged bdfca face adceb], %w[bae dabgfe gdbec ae]],
  [%w[ecbgaf efdgac edagf cefdg fgbdc gce eadc bfdega acbfedg ce], %w[ce efbgad fbcdg fcdgb]],
  [%w[bagf afbde bad gdfebc bdceag bdcagef acefd dgfbea bdfge ba], %w[abd fdbae cafde bfaged]],
  [%w[dcfaegb efdbc afecb ba bgcfda bac gbae gbface afecg gacfde], %w[abeg fcdage dgbacf febagc]],
  [%w[bafc faced cfagedb bdc bgead aefbcd degfcb bc gfaedc cedab], %w[dbc dcb feadc bdcagef]],
  [%w[ebadfc gf afebd gfb gafd ecdbg dcegfba dgabfe degfb abcgef], %w[gbf fdbgae fadbe gf]],
  [%w[cbagde bcdae dgcab dg dbeacf gefabd edcgafb acfgb dcge dgb], %w[gbacd debgac acbedf ecdg]],
  [%w[aegcf dagecf abegcf facgb fba cdagb bgfecda fb fbeg bdcfea], %w[bfeagc gbafce gcabfe fgeb]],
  [%w[dgebc dg ebcdf bfdcga gdc ebcadf baegc bedgcaf cbdegf gfed], %w[edgbc bdfgce dg gd]],
  [%w[cebd gbcfae fecgb gadbfc cdf dfceg fedag debfagc bfdecg cd], %w[bcfeg ecgfb acbfeg cegabf]],
  [%w[ab cbae dgfbe ebacgd gabed abgcdfe fagbdc abg efdcag decga], %w[bcaefdg fgdacb aceb bdcafeg]],
  [%w[ea bafgd cafgeb gae aegdb dbefacg begdac dcegb fbgced eacd], %w[aedc bdgea fbdecg gebacf]],
  [%w[afgdce fe gdecbf egfb cbaed bfcdage cef fgadbc dfebc gdcfb], %w[fe fec efdcbg fcdebg]],
  [%w[cfbdge fabcg bge eadb fgebda abegf ebgafdc eb dgaef adfecg], %w[gfecdb gacfde afbcg ecgbdf]],
  [%w[abecf bgcfad bdcg gfbeadc fbgad bfagc dgbfae fecgad gc cga], %w[fdabge bcfag dgabf acg]],
  [%w[gcfdae be decfg gedafcb cbge edb aecfbd agfbd cedfbg bgfde], %w[cdgbfe fgdceb gdcfe becg]],
  [%w[agfdce baecgf dgbaef afegc cebgd ad fcad gfcabde ead adegc], %w[ebfgca cfbage cgaebdf gafebd]],
  [%w[ea acfgde dfbacg egba cgfba caefb fbced cea egbcaf dabfceg], %w[bgecaf bgefac bfcaged fgbcae]],
  [%w[gbcfda cegbf cgd badfcge ceabd dg aedg gcbed bcaefd acedgb], %w[fcabgd dg fbgce gd]],
  [%w[bgface eafbcdg bdegfc efcdb dceafb ecdfg fgaed gcf gc dcbg], %w[gfc bcgefd fdceb gbfeac]],
  [%w[fdageb gefdbc cagbe fdgba ecadfgb dcfa abgcdf dbc bagcd cd], %w[agefdb bdagf dbc cgadbf]],
  [%w[gcfbd gafbcde aedg bfdga ad eacdfb bgcaef adf bgfae gdfeab], %w[bgfcdea aegbf fbdag gafcdeb]],
  [%w[dgabe fdace acbfge efdcabg egcda cge gc beadcg febgad gdbc], %w[dgcb gebadc adbge gdace]]
].freeze

REF = {
  1 => 'cf',     # 1 => 'cf' a droite
  7 => 'acf',    # 7 => 'a' en haut base sur cf
  4 => 'bcdf',   # 4 => donne 'b' en haut-gauche et 'd' en milieu base sur cf + be => 'e' en bas-gauche
  2 => 'acdeg',  # 2 base sur 4
  3 => 'acdfg',  # 3 base sur cf => donne 'be' a gauche
  5 => 'abdfg',  # 5 base sur 4
  0 => 'abcefg', # 0 base sur 4
  6 => 'abdefg', # 6 base sur reste
  9 => 'abcdfg', # 9 base sur 4
  8 => 'abcdefg' # 8
}.freeze

# eclater chaque mot en lettres, puis checker si elles sont include

# p INPUT[0]

def count_ones(output_values)
  output_values.count { |signal| signal.size == 2 }
end

def count_fours(output_values)
  output_values.count { |signal| signal.size == 4 }
end

def count_sevens(output_values)
  output_values.count { |signal| signal.size == 3 }
end

def count_eights(output_values)
  output_values.count { |signal| signal.size == 7 }
end

def count_ones_fours_sevens_eights(entry)
  output_values = entry[1]
  {
    1 => count_ones(output_values),
    4 => count_fours(output_values),
    7 => count_sevens(output_values),
    8 => count_eights(output_values)
  }
end

results = Hash.new(0)
INPUT.each do |entry|
  entry_count = count_ones_fours_sevens_eights(entry)
  entry_count.each do |k, v|
    results[k] += v
  end
end
p results.values.sum
