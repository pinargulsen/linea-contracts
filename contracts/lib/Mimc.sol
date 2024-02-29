// SPDX-License-Identifier: Apache-2.0

// Copyright 2023 Consensys Software Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Code generated by gnark DO NOT EDIT
pragma solidity 0.8.19;

library Mimc {
  uint256 constant FR_FIELD = 8444461749428370424248824938781546531375899335154063827935233455917409239041;

  function hash(bytes calldata _msg) external pure returns (bytes32 mimcHash) {
    assembly {
      let chunks := div(add(_msg.length, 0x1f), 0x20)

      for {
        let i := 0
      } lt(i, sub(chunks, 1)) {
        i := add(i, 1)
      } {
        let offset := add(_msg.offset, mul(i, 0x20))
        let chunk := calldataload(offset)

        let r := encrypt(mimcHash, chunk)
        mimcHash := addmod(addmod(mimcHash, r, FR_FIELD), chunk, FR_FIELD)
      }

      let offset := add(_msg.offset, mul(sub(chunks, 1), 0x20))
      let lastChunk := calldataload(offset)

      if iszero(eq(mod(_msg.length, 0x20), 0)) {
        let remaining := mod(_msg.length, 0x20)
        lastChunk := shr(mul(sub(0x20, remaining), 0x8), lastChunk)
      }

      let r := encrypt(mimcHash, lastChunk)
      mimcHash := addmod(addmod(mimcHash, r, FR_FIELD), lastChunk, FR_FIELD)

      function encrypt(h, chunk) -> output {
        let frField := FR_FIELD
        let tmpSum := 0

        tmpSum := addmod(
          addmod(chunk, h, frField),
          6780559962679281898511952483033644312910028090361101779689089025541625982996,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2327326745520207001136649348523057964841679868424949608370212081331899020358,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6201177823658417253260885485467023993767823924255470286063250782233002635405,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          3401276671970505639801802718275229999176446092725813928949571059366811327963,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          796636033841689627732941016044857384234234277501564259311815186813195010627,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          159507412325830262114089631199386481336725966652415909300570415682233424809,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          1669348614406363339435491723584591316524711695667693315027811919444714635748,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2220664510675218580883672035712942523468288190837741520497926350441362544422,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          1294712289478715410717626660893541311126892630747701030449280341780183665665,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6758843230175145783288330173723849603007070607311612566540600202723911987180,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6271650829101108787041306415787253036818921034903891854433479166754956001513,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          8037654458661109859150348337922011363549131313762043865209663327750426111866,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2450972517788523786981910980516860147992539249204314270739451472218657823669,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2707650969937705465351357815756127556801434183777713569980595073268026256128,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          7874262417209200618473337039194351886630571503697269268624099887104149796259,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          3089899920017810079637556867207463807565125948241456751227734590626249857937,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          8231877132811199596376758288825197494440517476607659739835166243301765860904,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          4889925300033981791993403687473437637164964770774352761851347729331041993593,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          506118690894045980182310960875885680782486421163823930266542078948815948062,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          4773308728424659273056201947330432214661646691949138677097247858746575076542,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6610301125072219342086627276930551094394509958433369744427479834611436778066,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          8062913614098409973923064402439991628739389434149534836396892159147794104642,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2576406140423312875091927795739341819101209176346955562285186911769083519728,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6247267546819369987508590432055536928557259658317014243676640822343115627202,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2354620213005699835215298236574714075068230025566107498090395819138978823906,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          1012123997779098542887516673253442986051441272786218052382513879552027657616,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          220252773286234814215172180118321537145064642853938490221604200051823270477,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2306037967476458159399202685728266972768173510335885477997450635969358782263,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          5906000615460106310157278190403974694555979202144571560620360962365001056276,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          8029952345415718287377564183334920026617762793749604843629313086537726648143,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6806091261750378774545720021859645013630360296898036304733359077422908323188,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          3791365032107216523624488143755156784159183778414385385850652127088602339940,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          7713951866326004273632564650741019619975760271948208739458822610304231437565,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2159153222189174173490067225063044363535871059524538695070191871847470955412,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          3459892854150586819083449948613048924207735017129514254460829121652786324530,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          8165919441562399076732808928206069494664474480220235797297111305840352207764,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          5067127638759272574597184239140007718698192996511162583428330546781376830321,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          7564926180046670501077982861476967417487855218354401587881011340975488196742,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          4793316512087044382791577380686883286681140325373390439122763061600650301139,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          12025027725022723723984202199185080936456585195449250668991990971241927925,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          5056480146405086811789505170440731715530475328844870175949109998024731067467,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          3850822128034659558863504800917443538100103152464488164345952697508772708155,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          5490569542353168488797150359760203713598401616662275350850844170956899716180,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6809916892509991991280249336166027496157481609693382555884367500846199028644,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6102228360565846712478499570512196976845845959851353003471378423251561935785,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          7957411254301481793006532646538815862020547208300835763521138686017052464640,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          7577948604138385646013244290592520699579040577712519004775644201729392063846,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6025758357861563690691793181574484773095829890586160167641973490103511417496,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2004214547184552249779883547311284063339374005887218065319674453115808726850,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          1316449090346410801845183915381769525990226349513436734911941391785200212382,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          4556285572033080226119128815763547597118327635770271287655822355222839175285,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          2369904002063218534853867482545647755243877244064168179905450676831047307618,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          7451702566176584025980909730992154118931318734166468698682947787653334803016,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          1329300832483899103910420486510886619321904846687482243968569167489052205690,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          3238521361072472828313630322811653086792441312858682853521070248794222258735,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          3475214489590830586915334473771293324307275731565327099797069845161869229357,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          4274287601159036159363576568654710230919275259553081321690187920135177947814,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6938336600682072955973769075275160235517201022692151378695173193891386346405,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          3998198747256139339077883878547228988120873864712400941893285440315291004215,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6699213631756936754252081929574788294275116402464654263316543921533804167968,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6962236729635042756258761323749531146700535903704299930132981735734543600942,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        tmpSum := addmod(
          addmod(output, h, frField),
          6961288456480688271133399693659146309378114560595485436408179085016705585674,
          frField
        )
        output := mulmod(tmpSum, tmpSum, frField)
        output := mulmod(output, output, frField)
        output := mulmod(output, output, frField)
        output := mulmod(mulmod(output, output, frField), tmpSum, frField)

        output := addmod(output, h, frField)
      }
    }
  }
}
