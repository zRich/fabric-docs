��          �               l  t  m  �   �    �  ]  �  O  1  {  �     �	  _  
  X   q  %   �     �  �    �   �  F   �    �  N   �     2  �  ?       �  0  �    #  �  �     u  �  �   /  <  -  A  j     �  H  �  ?        B     ^  8  x  �   �  ?   <   �   |   ]   h!     �!  X  �!     ,#  �  ?#   **Easier endorsement policy updates:** Fabric lifecycle allows you to change an endorsement policy without having to repackage or reinstall the chaincode. Users can also take advantage of a new default policy that requires endorsement from a majority of members on the channel. This policy is updated automatically when organizations are added or removed from the channel. **Inspectable chaincode packages:** The Fabric lifecycle packages chaincode in easily readable tar files. This makes it easier to inspect the chaincode package and coordinate installation across multiple organizations. **Multiple organizations must agree to the parameters of a chaincode:** In the release 1.x versions of Fabric, one organization had the ability to set parameters of a chaincode (for instance the endorsement policy) for all other channel members. The new Fabric chaincode lifecycle is more flexible since it supports both centralized trust models (such as that of the previous lifecycle model) as well as decentralized models requiring a sufficient number of organizations to agree on an endorsement policy before it goes into effect. **Safer chaincode upgrade process:** In the previous chaincode lifecycle, the upgrade transaction could be issued by a single organization, creating a risk for a channel member that had not yet installed the new chaincode. The new model allows for a chaincode to be upgraded only after a sufficient number of organizations have approved the upgrade. **Start multiple chaincodes on a channel using one package:** The previous lifecycle defined each chaincode on the channel using a name and version that was specified when the chaincode package was installed. You can now use a single chaincode package and deploy it multiple times with different names on the same or different channel. A chaincode typically handles business logic agreed to by members of the network, so it may be considered as a "smart contract". State created by a chaincode is scoped exclusively to that chaincode and can't be accessed directly by another chaincode. However, within the same network, given the appropriate permission a chaincode may invoke another chaincode to access its state. Chaincode Tutorials Chaincode is a program, written in `Go <https://golang.org>`_, `node.js <https://nodejs.org>`_, or `Java <https://java.com/en/>`_ that implements a prescribed interface. Chaincode runs in a secured Docker container isolated from the endorsing peer process. Chaincode initializes and manages ledger state through transactions submitted by applications. Chaincodes defined with the new lifecycle are not yet discoverable via service discovery CouchDB indexes are not yet supported Fabric Chaincode Lifecycle The Fabric Chaincode Lifecycle is responsible for managing the installation of chaincodes and the definition of their parameters before a chaincode is used on a channel. Starting from the Fabric 2.0 Alpha, governance for chaincodes is fully decentralized: multiple organizations can use the Fabric Chaincode Lifecycle to come to agreement on the parameters of a chaincode, such as the chaincode endorsement policy, before the chaincode is used to interact with the ledger. The new Fabric chaincode lifecycle in the v2.0 Alpha release is not yet feature complete. Specifically, be aware of the following limitations in the Alpha release: The new model offers several improvements over the previous lifecycle: These limitations will be resolved after the Alpha release. To use the old lifecycle model to install and instantiate a chaincode, visit the v1.4 version of the `Chaincode for Operators tutorial <https://hyperledger-fabric.readthedocs.io/en/release-1.4/chaincode4noah.html>`_ To learn how more about the new Fabric Lifecycle, visit :doc:`chaincode4noah`. Two Personas We offer two different perspectives on chaincode. One, from the perspective of an application developer developing a blockchain application/solution entitled :doc:`chaincode4ade`, and the other, :doc:`chaincode4noah` oriented to the blockchain network operator who is responsible for managing a blockchain network, and who would leverage the Hyperledger Fabric API to install and govern chaincode, but would likely not be involved in the development of a chaincode application. What is Chaincode? You can use the Fabric chaincode lifecycle by creating a new channel and setting the channel capabilities to V2_0. You will not be able to use the old lifecycle to install, instantiate, or update a chaincode on a channels with V2_0 capabilities enabled. However, you can still invoke chaincode installed using the previous lifecycle model after you enable V2_0 capabilities. Migration from the previous lifecycle to the new lifecycle is not supported for the Fabric v2.0 Alpha. Project-Id-Version: hyperledger-fabricdocs master
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-01 12:09+0800
PO-Revision-Date: 2019-04-22 19:54+0000
Last-Translator: Yang Cheng <cystone@aliyun.com>, 2019
Language: zh_CN
Language-Team: Chinese (China) (https://www.transifex.com/hyperledger/teams/97220/zh_CN/)
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 **更容易的背书策略更新：** Fabric 生命周期允许你在不重新打包和不重新安装链码的情况下修改背书策略。用户还可以利用新的默认策略，它需要通道的多数成员背书。当通道有组织加入或离开，这个策略可以自动更新。 **可查看的链码包装：** Fabric 生命周期将链码文件打包成易读的 tar 文件来。这使得查看链码包和跨多个组织协调安装链码变得更容易。 **多个组织必须认同一个链码中的参数：** 在 Fabric 1.x 版本中，一个组织有能力为通道的其他成员设置链码参数（如背书策略）。新 Fabric 链码生命周期更灵活，因为它同时支持中心化信任模型（如之前的生命周期模型）和去中心化模型，即在背书策略生效前需要足够多的组织认同。 **更安全的链码升级过程：**在之前的链码生命周期中，升级交易可以被单个组织发起，对于没有安装新链码的通道成员这带来了风险。新模式只有在足够数量的组织同意升级后才能升级链码。 **在通道上使用一个链码报包启动多个链码：**之前的生命周期中定义的是，当链码包安装的时候通道上每一个链码都使用链码包中指定的的名称和版本号。现在你可以使用一个链码包，在同一个或者不同的通道上使用不同的名称部署多次。 链码通常处理被网络成员认可的业务逻辑，所以它可以被认为是一个“智能合约”。链码创建的状态的作用域在链码中是唯一的，不能被其他链码直接访问。然而，在同一个网络中，给予适当的权限，一个链码可以被另一个链码访问它的状态。 链码教程 链码是一个用 `Go <https://golang.org>`_ 、  `node.js <https://nodejs.org>`_ 或 `Java <https://java.com/en/>`_ 语言编写的程序，它实现了一个规定的接口。 链码运行在一个隔离于背书节点进程的安全 Docker 容器中。链码通过由应用提交的交易来初始化和管理账本状态。 用新生命周期定义的链码还不能被服务发现找到 还不支持 CouchDB 索引 Fabric 链码生命周期 Fabric 链码生命周期负责管理链码安装和链码在一个通道中使用之前定义它们的参数。从 Fabric 2.0 Alpha 版开始，链码的管理是完全去中心的：多个组织可以使用 Fabric 链码周期来认可链码的参数，如在链码与账本交互前确定链码背书策略。 在 v2.0 Alpha 版中，新的 Fabric 链码生命周期的特性尚未完成。特别地，请注意 Alpha 发行版中的以下限制： 新模式相对于之前的生命周期提供了几个改进。 这些限制将在 Alpha 发行版之后得到解决。使用旧生命周期模型安装和实例化链码，请访问 v1.4 版本的`操作员链码教程<https://hyperledger-fabric.readthedocs.io/en/release-1.4/chaincode4noah.html>`_ 要学习更多新的关于 Fabric 生命周期的内容，请访问 :doc:`chaincode4noah`。 两种角色 对于链码我们提供两个不同的视角。一个是从开发区块链应用/解决方案的应用开发者视角，题为 :doc:`chaincode4ade`，另一个是 :doc:`chaincode4noah`，它面向负责管理区块链网络的操作员，他利用 Hyperledger Fabric API 来安装和管理链码，而不太可能参与链码应用的开发。 什么是链码？ 你可以通过创建一个新通道并设置通道功能到 V2_0 来使用 Fabric 链码生命周期。通道启用了 V2_0 功能后，你就不能使用旧生命周期来安装、实例化或更新链码。然而，你启用 V2_0 功能后，你仍然可以调用使用之前的生命周期模型安装的链码。 Fabric v2.0 Alpha 版不支持从之前的生命周期迁移到新生命周期。 