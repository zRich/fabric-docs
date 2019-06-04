��    /      �                E     �   S  �  �  ?   �  �   �  �  y  p     �   �  �   .	  $   �	  �  �	  /   �  .   �  I   +  =   u  U   �  �  	    �  Z   �  [   (  L   �  �   �  R  q  �   �  5   ^    �  �   �  �   C  �  ,  |   �  <   C  0  �  �   �  �   g  �   #  �     �   �    l  R   o  `  �  R   #!  Q  v!  �   �"  �   �#  o  �$  /   &  �  B&  .   (  �   B(  '  �(  7   �)  �   ,*  _  �*  d   ,  �   w,  �   -  �   �-  y  �.     +0  0   I0  @   z0  9   �0  W   �0  �  M1  �   �2  R   �3  M   
4  ?   X4  �   �4  C  .5  u   r6  4   �6  �   7  �   �7  �   �8  i  49  p   �:  +   ;    ;;  �   D<  �   �<  �   �=  �   s>  [   A?  �  �?  X   RA  .  �A  E   �B  8   C  �   YD  �   'E  W  F  �   YG   An application has to follow six basic steps to submit a transaction: An application interacts with a blockchain network using the Fabric SDK. Here's a simplified diagram of how an application invokes a commercial paper smart contract: As with the transaction proposal, it might appear that the application receives control soon after the smart contract completes, but that's not the case. Under the covers, the SDK manages the entire consensus process, and notifies the application when it is complete according to the strategy connectionOption. If you're interested in what the SDK does under the covers, read the detailed transaction flow. Audience: Architects, Application and smart contract developers From this point onwards, network will provide access to PaperNet.  Moreover, if the application wanted to access another network, BondNet, at the same time, it is easy: Here, commitTimeout tells the SDK to wait 100 seconds to hear whether a transaction has been committed. And strategy: EventStrategies.MSPID_SCOPE_ANYFORTX specifies that the SDK can notify an application after a single MagnetoCorp peer has confirmed the transaction, in contrast to strategy: EventStrategies.NETWORK_SCOPE_ALLFORTX which requires that all peers from MagnetoCorp and DigiBank to confirm the transaction. If our application simultaneously required access to another contract in PaperNet or BondNet this would be easy: If you'd like to, read more about how connection options allow applications to specify goal-oriented behaviour without having to worry about how it is achieved. In these examples, note how we didn't use a qualifying contract name -- we have only one smart contract per file, and getContract() will use the first contract it finds. In this topic, we're going to cover: It might appear that a smart contract receives control shortly after the application issues submitTransaction(), but that's not the case. Under the covers, the SDK uses the connectionOptions and connectionProfile details to send the transaction proposal to the right peers in the network, where it can get the required endorsements. But the application doesn't need to worry about any of this -- it just issues submitTransaction and the SDK takes care of it all! It was loaded and converted into a JSON object: Let's now submit this transaction to PaperNet! Let's now turn our attention to how the application handles the response! Let's now turn our attention to the connectionOptions object: Note also that wallets don't hold any form of cash or tokens -- they hold identities. Note how the application provides a name -- papercontract -- and an explicit contract name: org.papernet.commercialpaper! We see how a contract name picks out one contract from the papercontract.js chaincode file that contains many contracts. In PaperNet, papercontract.js was installed and instantiated with the name papercontract, and if you're interested, read how to install and instantiate a chaincode containing multiple smart contracts. Note that the submitTransaction API includes a process for listening for transaction commits. Listening for commits is required because without it, you will not know whether your transaction has successfully been orderered, validated, and committed to the ledger. Now our application has access to a second network, BondNet, simultaneously with PaperNet! Recall from papercontract.js how the issue transaction returns a commercial paper response: Recall the transaction MagnetoCorp uses to issue its first commercial paper: Right now, we're only interested in the channels: and peers: sections of the profile: (We've modified the details slightly to better explain what's happening.) See how channel: identifies the PaperNet: network channel, and two of its peers. MagnetoCorp has peer1.magenetocorp.com and DigiBank has peer2.digibank.com, and both have the role of endorsing peers. Link to these peers via the peers: key, which contains details about how to connect to them, including their respective network addresses. See how it specifies that identity, userName, and wallet, wallet, should be used to connect to a gateway. These were assigned values earlier in the code. See how the application selects a particular channel: See how the client application uses a gateway to insulate itself from the network topology, which might change. The gateway takes care of sending the transaction proposal to the right peer nodes in the network using the connection profile and connection options. See how the same paper class has been used in both the application and smart contract -- if you structure your code like this, it'll really help readability and reuse. See how the submitTransaction() parameters match those of the transaction request.  It's these values that will be passed to the issue() method in the smart contract, and used to create a new commercial paper.  Recall its signature: See how wallet locates a wallet in the local filesystem. The identity retrieved from the wallet is clearly for a user called Isabella, who is using the issue application. The wallet holds a set of identities -- X.509 digital certificates -- which can be used to access PaperNet or any other Fabric network. If you run the tutorial, and look in this directory, you'll see the identity credentials for Isabella. Spend a few moments examining the connection profile ./gateway/connectionProfile.yaml. It uses YAML, making it easy to read. Submitting a transaction is a single method call to the SDK: That’s it! In this topic you’ve understood how to call a smart contract from a sample application by examining how MagnetoCorp's application issues a new commercial paper in PaperNet. Now examine the key ledger and smart contract data structures are designed by in the architecture topic behind them. The application is now ready to issue a commercial paper.  To do this, it's going to use CommercialPaperContract and again, its fairly straightforward to access this smart contract: The connection profile contains a lot of information -- not just peers -- but network channels, network orderers, organizations, and CAs, so don't worry if you don't understand all of it! The peers defined in the gateway connectionProfile.yaml provide issue.js with access to PaperNet. Because these peers can be joined to multiple network channels, the gateway actually provides the application with access to multiple network channels! The second key class is a Fabric Gateway. Most importantly, a gateway identifies one or more peers that provide access to a network -- in our case, PaperNet. See how issue.js connects to its gateway: There are other connection options which an application could use to instruct the SDK to act intelligently on its behalf. For example: Think of a wallet holding the digital equivalents of your government ID, driving license or ATM card. The X.509 digital certificates within it will associate the holder with a organization, thereby entitling them to rights in a network channel. For example, Isabella might be an administrator in MagnetoCorp, and this could give her more privileges than a different user -- Balaji from DigiBank.  Moreover, a smart contract can retrieve this identity during smart contract processing using the transaction context. This allows paper to be used in a natural way in a descriptive completion message: To help your understanding, we'll make reference to the commercial paper sample application provided with Hyperledger Fabric. You can download it and run it locally. It is written in JavaScript, but the logic is quite language independent, so you'll be easily able to see what's going on! (The sample will become available for Java and GOLANG as well.) Towards the top of issue.js, you'll see two Fabric classes are brought into scope: We can see here a powerful feature of Hyperledger Fabric -- applications can participate in a network of networks, by connecting to multiple gateway peers, each of which is joined to multiple network channels. Applications will have different rights in different channels according to their wallet identity provided in gateway.connect(). You can read about the fabric-network classes in the node SDK documentation, but for now, let's see how they are used to connect MagnetoCorp's application to PaperNet. The application uses the Fabric Wallet class as follows: You'll notice a slight quirk -- the new paper needs to be converted to a buffer before it is returned to the application. Notice how issue.js uses the class method CommercialPaper.fromBuffer() to rehydrate the response buffer as a commercial paper: You're going to see how a typical application performs these six steps using the Fabric SDK. You'll find the application code in the issue.js file. View it in your browser, or open it in your favourite editor if you've downloaded it. Spend a few moments looking at the overall structure of the application; even with comments and spacing, it's only 100 lines of code! gateway.connect() has two important parameters: Project-Id-Version: hyperledger-fabricdocs master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-01 12:09+0800
PO-Revision-Date: 2019-04-22 20:00+0000
Last-Translator: 王伟兵 <wbwang@inspur.com>, 2019
Language: zh_CN
Language-Team: Chinese (China) (https://www.transifex.com/hyperledger/teams/97220/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 申请提交交易须遵循六个基本步骤: 应用程序使用Fabric SDK与区块链网络进行交互。下面是一个应用程序如何调用商业票据智能合约的简化图: 与交易提议一样，应用程序可能会在智能合约完成后不久收到控制，但事实并非如此。在幕后，SDK管理整个共识过程，并根据策略connectionOption通知应用程序何时完成。如果您对SDK的底层功能感兴趣，请阅读详细的交易流程。 受众:架构师、应用程序和智能合约开发者 从这一点开始，网络将提供访问PaperNet。此外，如果应用程序想同时访问另一个网络BondNet，则很容易: 这里，commitTimeout告诉SDK等待100秒，以得知交易是否被提交。 strategy: EventStrategies.MSPID_SCOPE_ANYFORTX指定SDK可以在一个MagnetoCorp peer确认了交易之后通知应用程序，这与strategy: EventStrategies.NETWORK_SCOPE_ALLFORTX形成了对比，它要求来自MagnetoCorp和DigiBank的所有peer确认这笔交易。 如果我们的应用程序需要同时在PaperNet或BondNet访问另一个合约这将是容易的: 如果您愿意，请阅读更多关于连接选项如何允许应用程序指定面向目标的行为，而不必担心如何实现该行为。 在这些示例中，请注意我们没有使用符合条件的合约名称——每个文件只有一个智能合约，getContract()将使用它找到的第一个合约。 在这个主题中，我们将涉及:
调用智能合约的应用程序流程
应用程序如何使用钱包和身份
应用程序如何使用网关连接
如何访问特定的网络
如何构造交易请求
如何提交交易
如何处理交易响应 智能合约似乎在应用程序发出submitTransaction()之后不久就会收到控制，但事实并非如此。在幕后，SDK使用connectionOptions和connectionProfile详细信息将交易提议发送到网络中的正确peer，在那里可以获得所需的背书。但是应用程序不需要担心这些——它只会发出submitTransaction, SDK会处理所有这些! 加载并转换为JSON对象: 现在让我们把这个交易提交到PaperNet! 现在让我们将注意力转向应用程序如何处理响应! 现在让我们将注意力转向connectionOptions对象: 还要注意，钱包里没有任何形式的现金或代币——它们容纳身份。 注意，应用程序如何提供一个名称——papercontract——和一个显式的合约名称:org.papernet.commercialpaper! 我们将看到如何利用合约名称从包含许多合约的papercontract.js链码文件中选择一个合约。在PaperNet中，papercontract.js以papercontract的名称安装和实例化，如果您感兴趣，请阅读如何安装和实例化包含多个智能合约的链码。 注意，submitTransaction API包含一个侦听交易提交的进程。侦听提交是必需的，因为没有提交，您将不知道您的交易是否已成功地排序、验证和提交到账本。 现在我们的应用程序可以访问第二个网络BondNet，与PaperNet一起! 回想一下papercontract.js中的发行交易如何返回商业票据响应: 回忆一下MagnetoCorp发行第一份商业票据时的交易: 现在，我们只对概要文件的 channels: 和peers: 部分感兴趣(我们稍微修改了一些细节，以便更好地解释发生了什么)。 请参见channel: 如何标识PaperNet: 网络通道，及其两个peer。MagnetoCorp拥有peer1.magenetocorp.com和DigiBank拥有peer2.digibank.com，两者都具有着背书peer的角色。通过peers: key 连接到这些peer，其中包含关于如何连接到它们的详细信息，包括它们各自的网络地址。 查看它如何指定用于连接到网关的标识、用户名和钱包。这些值是在代码的前部赋予的。 查看应用程序如何选择一个特定的通道: 了解客户端应用程序如何使用网关将自己与可能发生更改的网络拓扑隔离。网关使用连接概要文件和连接选项将交易提议发送到网络中的正确peer节点。 查看相同的票据类在应用程序和智能合约中是如何使用的——如果您像这样构造代码，它将真正有助于可读性和重用。 查看submitTransaction()参数如何匹配交易请求的参数。这些值将传递给智能合约中的issue()方法，并用于创建新的商业票据。回忆它的签名: 查看wallet如何在本地文件系统中定位钱包。从钱包中检索到的身份显然是针对一个名为Isabella的用户的，他正在使用发行应用程序。该钱包拥有一组身份(X.509数字证书)，可用于访问PaperNet或任何其他Fabric网络。如果您运行本教程并查看这个目录，您将看到Isabella的身份凭证。 花一些时间检查连接概要文件 ./gateway/connectionProfile.yaml。它使用YAML，使其易于阅读。 提交交易是对SDK的一个方法调用: 就是这样! 在本主题中，通过研究MagnetoCorp的应用程序如何在PaperNet中发行新的商业票据，您已经了解了如何从示例应用程序调用智能合约。现在研究一下关键账本和智能合约数据结构背后的架构主题。 该应用程序现在可以发行商业票据了。要做到这一点，它将使用CommercialPaperContract，同样，它是简单地访问这个智能合约: 连接配置文件包含很多信息——不仅仅是peer——还包括网络通道、网络排序器、组织和CA，所以如果您不了解所有信息，请不要担心! 在网关的connectionProfile.yaml 中定义的peer提供了issue.js访问PaperNet的权限。因为这些peer可以连接到多个网络通道，所以网关实际上为应用程序提供了对多个网络通道的访问! 第二个关键类是Fabric网关。最重要的是，网关标识一个或多个peer，这些peer提供对网络的访问——在我们的示例中是PaperNet。查看issue.js如何连接到它的网关: 应用程序还可以使用其他连接选项来指示SDK代表它聪明地工作。例如: 想象一个钱包，里面装着你的身份证、驾照或ATM卡的数字等价物。其中的X.509数字证书将使持有者与某个组织相关联，从而赋予他们在网络通道中的权利。例如，Isabella可能是MagnetoCorp的一名管理员，这可能会给她比其他用户(来自DigiBank的Balaji)更多的特权。此外，智能合约可以在使用交易上下文进行智能合约处理期间检索此身份。 这使得票据能够以一种自然的方式在一个描述性的完成信息中使用: 为了帮助您理解，我们将参考超级账本Fabric提供的商业票据示例应用程序。您可以下载它并在本地运行它。它是用JavaScript编写的，但是逻辑是完全独立于语言的，所以您可以很容易地看到发生了什么!(Java和GOLANG也将提供该示例。) 在issue.js的顶部，你会看到两个Fabric类被纳入作用域: 我们可以在这里看到超级账本Fabric的一个强大特性——应用程序可以通过连接到多个网关peer(每个网关peer都加入到多个网络通道)，参与到一个网络网络中。根据gateway.connect()中提供的钱包身份，应用程序在不同的通道中具有不同的权限。 您可以阅读node SDK文档中关于fabric-network类的内容，但是现在，让我们看看如何将MagnetoCorp的应用程序连接到PaperNet。应用程序使用Fabric Wallet（钱包）类如下: 您将注意到一个小问题——在将新文件返回到应用程序之前，需要将其转换为缓冲。注意issue.js如何使用CommercialPaper.fromBuffer()类方法将响应缓冲重新还原为商业票据: 您将看到一个典型的应用程序如何使用Fabric SDK执行这六个步骤。您将在issue.js文件中找到应用程序代码。在您的浏览器中查看它，或者在您最喜欢的编辑器中打开它(如果您已经下载了它)。花点时间看看应用程序的整体结构;即使有注释和间距，也只有100行代码! gateway.connect()有两个重要的参数:
- connectionProfile:连接概要文件的文件系统位置，它将一组peer标识为到PaperNet的网关 
- connectionOptions:一组用于控制issue.js如何与PaperNet交互的选项 