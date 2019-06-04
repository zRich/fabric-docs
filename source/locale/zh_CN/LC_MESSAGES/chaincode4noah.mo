Þ          Ô                     ¬    ¹  À    z      e  §	      '  ¬  É   Ô      ©   ¸  1  b      d  ¦  ^    ¨  j  Þ    Â   ò  Æ  µ  î   |    k   G  ü!  Ð  D$  5  &  J  K'    (  Ò   ¢*  è   u+  0  ^,  Ñ  -  á   a/  ª   C0  ð   î0     ß1  z  i2  Ü   ä4    Á5  ø   Ò6  6  Ë7  $  9  ¥   ';    Í;  ¾   m=  8  ,>  á  e?   A chaincode typically handles business logic agreed to by members of the network, so it may be considered as a "smart contract". Ledger updates created by a chaincode are scoped exclusively to that chaincode and can't be accessed directly by another chaincode. However, within the same network, given the appropriate permission a chaincode may invoke another chaincode to access its state. A successful install command will return a chaincode package identifier, which is the package label combined with a hash of the package. This package identifier is used to associate a chaincode package installed on your peers with a chaincode definition approved by your organization. Save the identifier for next step. You can also find the package identifier by querying the packages installed on your peer using the Peer CLI. After the chaincode definition has been committed to the channel, channel members can start using the chaincode. The first invoke of the chaincode will start the chaincode containers on all of the peers targeted by the transaction proposal, as long as those peers have installed the chaincode package. You can use the chaincode definition to require the invocation of the Init function to start the chaincode. Otherwise, a channel member can start the chaincode container by invoking any transaction in the chaincode. The first invoke, whether of an Init function or other transaction, is subject to the chaincode endorsement policy. It may take a few minutes for the chaincode container to start. An organization can approve a chaincode definition without installing the chaincode package. If an organization does not need to use the chaincode, they can approve a chaincode definition without a package identifier to ensure that the Lifecycle Endorsement policy is satisfied. Chaincode is a program, written in Go, Node.js, or Java that implements a prescribed interface. Chaincode runs in a secured Docker container isolated from the endorsing peer process. Chaincode initializes and manages ledger state through transactions submitted by applications. Chaincode needs to be packaged in a tar file before it can be installed on your peers. You can package a chaincode using the Fabric peer binaries, the Node Fabric SDK, or a third party tool such as GNU tar. When you create a chaincode package, you need to provide a chaincode package label to create a succinct and human readable description of the package. Each channel member that wants to use the chaincode needs to approve a chaincode definition for their organization. This approval needs to be submitted to the ordering service, after which it is distributed to all peers. This approval needs to be submitted by your Organization Administrator, whose signing certificate is listed as an admin cert in the MSP of your organization definition. After the approval transaction has been successfully submitted, the approved definition is stored in a collection that is available to all the peers of your organization. As a result you only need to approve a chaincode for your organization once, even if you have multiple peers. Fabric chaincode lifecycle requires that organizations agree to the parameters that define a chaincode, such as name, version, and the chaincode endorsement policy. Channel members come to agreement using the following four steps. Not every organization on a channel needs to complete each step. If you use a third party tool to package the chaincode, the resulting file needs to be in the format below. The Fabric peer binaries and the Fabric SDKs will automatically create a file in this format. In the following sections, we will explore chaincode through the eyes of a blockchain network operator rather than an application developer. Chaincode operators can use this tutorial to learn how to use the Fabric chainode lifecycle to deploy and manage chaincode on their network. Note: The new Fabric chaincode lifecycle in the v2.0 Alpha release is not yet feature complete. Specifically, be aware of the following limitations in the Alpha release: Once a sufficient number of channel members have approved a chaincode definition, one organization can commit the definition to the channel. You can use the queryapprovalstatus command to find which channel members have approved a definition before committing it to the channel using the peer CLI. The commit transaction proposal is first sent to the peers of channel members, who query the chaincode definition approved for their organizations and endorse the definition if their organization has approved it. The transaction is then submitted to the ordering service, which then commits the chaincode definition to the channel. The commit definition transaction needs to be submitted as the Organization Administrator, whose signing certificate is listed as an admin cert in the MSP of your organization definition. The Fabric chaincode lifecycle is a process that allows multiple organizations to agree on how a chaincode will be operated before it can be used on a channel. The tutorial will discuss how a chaincode operator would use the Fabric lifecycle to perform the following tasks: The Fabric chaincode lifecycle uses the sequence in the chaincode definition to keep track of upgrades. All channel members need to increment the sequence number by one and approve a new definition to upgrade the chaincode. The version parameter is used to track the chaincode binaries, and needs to be changed only when you upgrade the chaincode binaries. The chaincode definition also includes the Package Identifier. This is a required parameter for each organization that wants to use the chaincode. The package ID does not need to be the same for all organizations. An organization can approve a chaincode definition without installing a chaincode package or including the identifier in the definition. The chaincode is governed by a chaincode definition. When channel members approve a chaincode definition, the approval acts as a vote by an organization on the chaincode parameters it accepts. These approved organization definitions allow channel members to agree on a chaincode before it can be used on a channel. The chaincode definition includes the following parameters, which need to be consistent across organizations: The number of organizations that need to approve a definition before it can be successfully committed to the channel is governed by the Channel/Application/LifecycleEndorsement policy. By default, this policy requires that a majority of organizations in the channel endorse the transaction. The LifecycleEndorsement policy is separate from the chaincode endorsement policy. For example, even if a chaincode endorsement policy only requires signatures from one or two organizations, a majority of channel members still need to approve the chaincode definition according to the default policy. When committing a channel definition, you need to target enough peer organizations in the channel to satisfy your LifecycleEndorsement policy. These limitations will be resolved after the Alpha release. To use the old lifecycle model to install and instantiate a chaincode, visit the v1.4 version of the Chaincode for Operators tutorial. This tutorial provides a detailed overview of the operations of the Fabric chaincode lifecycle rather than the specific commands. To learn more about how to use the Fabric lifecycle using the Peer CLI, see Install and define a chaincode in the Building your First Network Tutorial or the peer lifecycle command reference. To learn more about how to use the Fabric lifecycle using the Fabric SDK for Node.js, visit How to install and start your chaincode. You can upgrade a chaincode using the same Fabric lifecycle process as you used to install and start the chainocode. You can upgrade the chaincode binaries, or only update the chaincode policies. Follow these steps to upgrade a chaincode: You can use the Fabric chaincode lifecycle by creating a new channel and setting the channel capabilities to V2_0. You will not be able to use the previous lifecycle to install, instantiate, or update a chaincode on a channels with V2_0 capabilities enabled. There is no upgrade support to the v2.0 Alpha release, and no intended upgrade support from the the Alpha release to future versions of v2.x. You need to install the chaincode package on every peer that will execute and endorse transactions. Whether using the CLI or an SDK, you need to complete this step using your Peer Administrator, whose signing certificate is in the admincerts folder of your peer MSP. It is recommended that organizations only package a chaincode once, and then install the same package on every peer that belongs to their org. If a channel wants to ensure that each organization is running the same chaincode, one organization can package a chaincode and send it to other channel members out of band. Project-Id-Version: hyperledger-fabricdocs master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-01 12:09+0800
PO-Revision-Date: 2019-04-22 19:58+0000
Last-Translator: çä¼åµ <wbwang@inspur.com>, 2019
Language: zh_CN
Language-Team: Chinese (China) (https://www.transifex.com/hyperledger/teams/97220/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 é¾ç éå¸¸å¤çç½ç»æåè®¤åçä¸å¡é»è¾ï¼å æ­¤å®å¯ä»¥è¢«è§ä¸ºâæºè½åçº¦âãç±é¾ç åå»ºçè´¦æ¬æ´æ°åªéç¨äºè¯¥é¾ç ï¼ä¸è½è¢«å¶ä»é¾ç ç´æ¥è®¿é®ãä½æ¯ï¼å¨ç¸åçç½ç»ä¸­ï¼ç»å®éå½çæéï¼ä¸ä¸ªé¾ç å¯ä»¥è°ç¨å¦ä¸ä¸ªé¾ç æ¥è®¿é®å®çç¶æã ä¸ä¸ªæåçå®è£å½ä»¤å°è¿åä¸ä¸ªé¾ç åæ è¯ç¬¦ï¼å®æ¯ä¸ä¸ªåæ ç­¾ååçæ£åç»åãæ­¤åæ è¯ç¬¦ç¨äºå°å®è£å¨èç¹ä¸çé¾ç åä¸ç»ç»æ¹åçé¾ç å®ä¹å³èèµ·æ¥ãä¸ºä¸ä¸æ­¥ä¿å­æ è¯ç¬¦ãæ¨è¿å¯ä»¥éè¿ä½¿ç¨èç¹CLIæ¥è¯¢å®è£å¨æ¨çèç¹ä¸çåæ¥æ¾å°åæ è¯ç¬¦ã å°é¾ç å®ä¹æäº¤ç»ééåï¼ééæåå¯ä»¥å¼å§ä½¿ç¨é¾ç ãé¾ç çç¬¬ä¸æ¬¡è°ç¨å°å¨äº¤ææè®®åéç»çææèç¹ä¸å¯å¨é¾ç å®¹å¨ï¼åªè¦è¿äºèç¹å·²ç»å®è£äºé¾ç åãæ¨å¯ä»¥ä½¿ç¨é¾ç å®ä¹æ¥è¦æ±è°ç¨Initå½æ°æ¥å¯å¨é¾ç ãå¦åï¼ééæåå¯ä»¥éè¿è°ç¨é¾ç ä¸­çä»»ä½äº¤ææ¥å¯å¨é¾ç å®¹å¨ãæ è®ºæ¯åå§åå½æ°è¿æ¯å¶ä»äº¤æçç¬¬ä¸ä¸ªè°ç¨ï¼é½åé¾ç èä¹¦ç­ç¥ççº¦æãé¾ç å®¹å¨å¯è½éè¦å åéçæ¶é´æè½å¯å¨ã ç»ç»å¯ä»¥å¨ä¸å®è£é¾ç åçæåµä¸æ¹åé¾ç å®ä¹ãå¦æç»ç»ä¸éè¦ä½¿ç¨é¾ç ï¼ä»ä»¬å¯ä»¥å¨æ²¡æåæ è¯ç¬¦çæåµä¸æ¹åé¾ç å®ä¹ï¼ä»¥ç¡®ä¿æ»¡è¶³çå½å¨æèä¹¦ç­ç¥ã é¾ç æ¯ä¸ä¸ªç¨åºï¼ç¨GoãNode.jsæJavaç¼åï¼å®ç°æå®çæ¥å£ãé¾ç è¿è¡å¨å®å¨çDockerå®¹å¨ä¸­ï¼è¯¥å®¹å¨ä¸èä¹¦èç¹è¿ç¨éç¦»ãé¾ç éè¿åºç¨ç¨åºæäº¤çäº¤æåå§ååç®¡çè´¦æ¬ç¶æã  é¾ç éè¦æåå¨taræä»¶ä¸­ï¼ç¶åæè½å®è£å°æ¨çèç¹ä¸ãæ¨å¯ä»¥ä½¿ç¨Fabricèç¹äºè¿å¶æä»¶ãNode Fabric SDKæç¬¬ä¸æ¹å·¥å·(å¦GNU tar)æåé¾ç ãå½æ¨åå»ºä¸ä¸ªé¾ç åæ¶ï¼æ¨éè¦æä¾ä¸ä¸ªé¾ç åæ ç­¾æ¥åå»ºä¸ä¸ªç®æ´çãäººç±»å¯è¯»çåæè¿°ã å¸æä½¿ç¨é¾ç çæ¯ä¸ªééæåé½éè¦ä¸ºå¶ç»ç»æ¹åä¸ä¸ªé¾ç å®ä¹ãæ­¤æ¹åéè¦æäº¤ç»æåºæå¡ï¼ç¶åååç»ææèç¹ãæ­¤æ¹åéè¦ç±ç»ç»ç®¡çåæäº¤ï¼å¶ç­¾åè¯ä¹¦å¨ç»ç»å®ä¹çMSPä¸­ä½ä¸ºç®¡çè¯ä¹¦ååºãæåæäº¤æ¹åäº¤æåï¼å·²æ¹åçå®ä¹å­å¨å¨ä¸ä¸ªéåä¸­ï¼è¯¥éåå¯ç¨äºç»ç»çææèç¹ãå æ­¤ï¼å³ä½¿æ¨æå¤ä¸ªèç¹ï¼ä¹åªéè¦ä¸ºæ¨çç»ç»æ¹åä¸æ¬¡é¾ç ã Fabricé¾ç çå½å¨æè¦æ±ç»ç»åæå®ä¹é¾ç çåæ°ï¼ä¾å¦åç§°ãçæ¬åé¾ç èä¹¦ç­ç¥ãééæåéè¿ä»¥ä¸åä¸ªæ­¥éª¤è¾¾æåè®®ãå¹¶ä¸æ¯æ¯ä¸ªééä¸çç»ç»é½éè¦å®ææ¯ä¸ªæ­¥éª¤ã å¦æä½¿ç¨ç¬¬ä¸æ¹å·¥å·æ¥æåé¾ç ï¼åçæçæä»¶éè¦éç¨ä»¥ä¸æ ¼å¼ãFabricèç¹äºè¿å¶æä»¶åFabric SDKså°èªå¨åå»ºè¿ç§æ ¼å¼çæä»¶ã å¨æ¥ä¸æ¥çé¨åä¸­ï¼æä»¬å°éè¿åºåé¾ç½ç»æä½èèä¸æ¯åºç¨ç¨åºå¼åèçè§è§æ¥ç ç©¶é¾ç ãé¾ç æä½èå¯ä»¥ä½¿ç¨æ¬æç¨å­¦ä¹ å¦ä½ä½¿ç¨Fabricé¾ç çå½å¨æå¨å¶ç½ç»ä¸é¨ç½²åç®¡çé¾ç ã æ³¨æ:å¨v2.0 Alphaçæ¬ä¸­ï¼æ°çFabricé¾ç çå½å¨æè¿æ²¡æå®æãå·ä½æ¥è¯´ï¼è¦æ³¨æAlphaåè¡çä¸­çä»¥ä¸éå¶: ä¸æ¦æè¶³å¤æ°éçééæåæ¹åäºé¾ç å®ä¹ï¼ä¸ä¸ªç»ç»å°±å¯ä»¥å°è¯¥å®ä¹æäº¤ç»ééãå¨ä½¿ç¨èç¹çCLIå°å®ä¹æäº¤å°ééä¹åï¼å¯ä»¥ä½¿ç¨queryapprovalstatuså½ä»¤æ¥æ¾åªäºééæåå·²ç»æ¹åäºè¯¥å®ä¹ãæäº¤äº¤ææè®®é¦ååéç»ééæåçèç¹ï¼è¿äºæåæ¥è¯¢ä¸ºå¶ç»ç»æ¹åçé¾ç å®ä¹ï¼å¦æç»ç»å·²ç»æ¹åäºè¯¥å®ä¹ï¼åå¯¹å¶è¿è¡èä¹¦ãç¶åå°äº¤ææäº¤ç»æåºæå¡ï¼ç¶åè¯¥æå¡å°é¾ç å®ä¹æäº¤ç»ééãæäº¤å®ä¹äº¤æéè¦ä½ä¸ºç»ç»ç®¡çåæäº¤ï¼å¶ç­¾åè¯ä¹¦å¨ç»ç»å®ä¹çMSPä¸­ä½ä¸ºç®¡çè¯ä¹¦ååºã Fabric é¾ç çå½å¨ææ¯ä¸ä¸ªåè®¸å¤ä¸ªç»ç»å¨é¾ç å¨ééä¸ä½¿ç¨ä¹åï¼å°±å¦ä½æä½è¾¾æä¸è´æè§çç¨åºãæ¬æç¨å°è®¨è®ºé¾ç æä½åå¦ä½ä½¿ç¨Fabricçå½å¨ææ¥æ§è¡ä»¥ä¸ä»»å¡ï¼ Fabricé¾ç çå½å¨æä½¿ç¨é¾ç å®ä¹ä¸­çåºåæ¥è·è¸ªåçº§ãææééæåé½éè¦å°åºåå·å¢å 1ï¼å¹¶æ¹åä¸ä¸ªæ°çå®ä¹æ¥åçº§é¾ç ãçæ¬åæ°ç¨äºè·è¸ªé¾ç äºè¿å¶æä»¶ï¼åªæå¨åçº§é¾ç äºè¿å¶æä»¶æ¶æéè¦æ´æ¹ã  é¾ç å®ä¹è¿åæ¬åæ è¯ç¬¦ãå¯¹äºå¸æä½¿ç¨é¾ç çæ¯ä¸ªç»ç»ï¼è¿é½æ¯å¿éçåæ°ãåIDä¸éè¦å¯¹ææç»ç»é½æ¯ç¸åçãç»ç»å¯ä»¥å¨ä¸å®è£é¾ç åæå¨å®ä¹ä¸­åå«æ è¯ç¬¦çæåµä¸æ¹åé¾ç å®ä¹ã é¾ç ç±é¾ç å®ä¹æ§å¶ãå½ééæåæ¹åé¾ç å®ä¹æ¶ï¼è¯¥æ¹åä½ä¸ºç»ç»å¯¹å¶æ¥åçé¾ç åæ°çè¡¨å³ãè¿äºç»è¿æ¹åçç»ç»å®ä¹åè®¸ééæåå¨é¾ç å¨ééä¸ä½¿ç¨ä¹åå°±é¾ç è¾¾æä¸è´ãé¾ç å®ä¹åæ¬ä»¥ä¸åæ°ï¼è¿äºåæ°éè¦è·¨ç»ç»ä¿æä¸è´: å¨å°å®ä¹æåæäº¤ç»ééä¹åï¼éè¦æ¹åè¯¥å®ä¹çç»ç»æ°éç±éé/åºç¨ç¨åº/çå½å¨æèä¹¦ç­ç¥æ§å¶ãé»è®¤æåµä¸ï¼è¯¥ç­ç¥è¦æ±ééä¸­çå¤§å¤æ°ç»ç»è®¤å¯è¯¥äº¤æãçå½å¨æèä¹¦ç­ç¥ä¸é¾ç èä¹¦ç­ç¥æ¯åå¼çãä¾å¦ï¼å³ä½¿æé¾ç èä¹¦ç­ç¥åªéè¦ä¸ä¸ªæä¸¤ä¸ªç»ç»çç­¾åï¼å¤§å¤æ°ééæåä»ç¶éè¦æ ¹æ®é»è®¤ç­ç¥æ¹åé¾ç å®ä¹ãå¨æäº¤ééå®ä¹æ¶ï¼æ¨éè¦å¨ééä¸­åéç»è¶³å¤å¤çèç¹ç»ç»ï¼ä»¥æ»¡è¶³æ¨ççå½å¨æèä¹¦ç­ç¥ã è¿äºéå¶å°å¨Alphaåè¡çä¹åå¾å°è§£å³ãè¦ä½¿ç¨æ§ççå½å¨ææ¨¡åæ¥å®è£åå®ä¾åé¾ç ï¼è¯·è®¿é®é¾ç çæä½åæç¨çv1.4çæ¬ã æ¬æç¨æä¾äºFabricé¾ç çå½å¨ææä½çè¯¦ç»æ¦è¿°ï¼èä¸æ¯å·ä½çå½ä»¤ãè¦äºè§£å³äºå¦ä½ä½¿ç¨èç¹çCLIæ¥ä½¿ç¨Fabricçå½å¨æçæ´å¤ä¿¡æ¯ï¼è¯·åè§å¨æå»ºæ¨çç¬¬ä¸ä¸ªç½ç»æç¨æèç¹ççå½å¨æå½ä»¤å¼ç¨ä¸­å®è£åå®ä¹é¾ç ãè¦äºè§£å³äºå¦ä½ä½¿ç¨Fabric SDK for Node.jsä½¿ç¨Fabricçå½å¨æçæ´å¤ä¿¡æ¯ï¼è¯·è®¿é®å¦ä½å®è£åå¯å¨é¾ç ã æ¨å¯ä»¥ä½¿ç¨ä¸å®è£åå¯å¨é¾ç ç¸åçFabricçå½å¨æè¿ç¨æ¥åçº§é¾ç ãæ¨å¯ä»¥åçº§é¾ç äºè¿å¶æä»¶ï¼æèåªæ´æ°é¾ç ç­ç¥ãæç§ä»¥ä¸æ­¥éª¤åçº§é¾ç : æ¨å¯ä»¥éè¿åå»ºä¸ä¸ªæ°ééå¹¶å°ééåè½è®¾ç½®ä¸ºV2_0æ¥ä½¿ç¨Fabricé¾ç çå½å¨æãæ¨å°æ æ³ä½¿ç¨åä¸ä¸ªçå½å¨æå¨å¯ç¨V2_0åè½çééä¸å®è£ãå®ä¾åææ´æ°é¾ç ãæ²¡æå¯¹v2.0 Alphaçæ¬çåçº§æ¯æï¼ä¹æ²¡æä»Alphaçæ¬å°æªæ¥çæ¬v2.xçåçº§æ¯æã ä½ éè¦å¨æ¯ä¸ä¸ªæ§è¡åèä¹¦äº¤æçèç¹ä¸å®è£é¾ç åãæ è®ºä½¿ç¨CLIè¿æ¯SDKï¼é½éè¦ä½¿ç¨èç¹ç®¡çåå®ææ­¤æ­¥éª¤ï¼èç¹ç®¡çåçç­¾åè¯ä¹¦ä½äºèç¹MSPçadmincertsæä»¶å¤¹ä¸­ãå»ºè®®ç»ç»åªæåä¸æ¬¡é¾ç ï¼ç¶åå¨å±äºå¶ç»ç»çæ¯ä¸ªèç¹ä¸å®è£ç¸åçåãå¦æä¸ä¸ªééæ³è¦ç¡®ä¿æ¯ä¸ªç»ç»è¿è¡ç¸åçé¾ç ï¼é£ä¹ä¸ä¸ªç»ç»å¯ä»¥æåä¸ä¸ªé¾ç å¹¶ç¨å¸¦å¤æ¹å¼å°å¶åéå°å¶ä»ééæåã 