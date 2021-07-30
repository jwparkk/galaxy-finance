# Galaxy-finance

## [ Project overview ]
Galaxy.fi is an open crypto price prediction platform for crypto investors. Project’s main goal is to provide a visualized, high-quality crypto information for investors while being an open space for exchange of ideas and predictions. Through this process, Galaxy.fi visualizes current market situation interpreted by market participants. Galaxy.fi achieves this goal by incentivizing all the crypto investors who provide high quality information. 

Galaxy.fi는 암호화폐 투자자들의 가격 예측과 토론이 자유롭게 이뤄지는 플랫폼입니다. 투자자들은 galaxy.fi를 통해 양질의 투자 정보를 얻을 수 있습니다. 
누구나 BTC 가격을 예측하여 범위를 제시할 수 있고, 누구나 반대나 동의를 할 수 있습니다. 양질의 정보를 제공하는 자는 글을 쓰며 보상을 받고, 투표자는 자신이 동의하는 글에 투표를 하여 보상을 받을 수 있습니다.
가격예측과 정보공유 과정에서 플랫폼 토큰인 Galaxy토큰이 사용됩니다. Galaxy 토큰은 이더리움을 스테이킹 한 뒤 받을 수 있습니다. 토큰을 활용하여 투표를 하는 과정에서 사용자는 가격에 대한 자신의 예측을 뒷받침할 만한 근거를 찾고, 이를 투자에 활용하게 됩니다.

 
## [ Ecosystem participants ]
Galaxy.fi에는 크게 2가지 종류의 참여자가 있습니다. 글 작성자와 투표자입니다. 글 작성자는 제한된 범위의 BTC 가격 예측을 양질의 근거와 함께 제시할 시 보상을 받습니다. 투표자는 자신이 원하는 글에 투표를 할 수 있으며 이를 통해 보상을 얻습니다. 
Galaxy.fi ecosystem is primarily comprised of 2 types of users: Writers, voters and developers. Writers are incentized to write a high-quality article with limited BTC prediction range. Voters can vote for the article that they want, which they believe would be true in the future. Developers integrate Galaxy.fi’s smart contracts with ranking and voting interfaces.  

### 1. Voter 
- 투표자는 G 토큰으로 마음에 드는 글에 투표합니다. 투표자는 스스로 BTC 가격 예측을 하거나, 많은 사람의 동의를 받은 글에 투표할 수 있습니다. 만약 시간이 흐른 후, 투표한 글의 BTC 가격 예측이 옳은 것으로 판정된다면, 투표자는 보상을 받습니다. 자세한 사항은 아래와 같습니다.  
- 투표자가 투표한 글의 가격 예측이 맞고, G 토큰으로 동의 표시를 했을 시 보상을 받습니다. 투표에 사용된 토큰보다 더 많은 양의 토큰을 받게 됩니다. 반대로 글 작성자의 가격 예측이 틀렸을 때 투표자가 G 토큰으로 동의 표시를 한다면, 투표자는 투표에 사용한 토큰보다 더 적은 양의 토큰을 받습니다. 
- 만약 투표자가 투표한 글의 가격 예측이 틀렸다면, 위의 경우를 뒤집어 반대에 투표한 사람이 보상을 얻습니다. 물론 틀린 글에 찬성 투표를 한 사람은 투표에 사용한 토큰보다 적은 토큰을 받게 됩니다.  

### 2. Writer 
- 글 작성자는 Galaxy.fi가 제공하는 BTC 가격 예측 범위에 자신이 예상하는 가격을 적어넣고, 그를 뒷받침하는 근거를 제시합니다. 가격 예측 범위는 무엇이든 가능하고, 근거 역시 무엇이든 가능합니다. 그것은 온체인 지표일 수도 있고, 기술적 분석일 수도 있으며, 앞으로 예상되는 뉴스일 수도 있습니다. 
- 글 작성자가 큰 보상을 받기 위해서는 우선 자신이 예측한 BTC의 가격 범위가 실제의 가격 범위와 일치해야 합니다. 그리고 그 범위가 좁을수록, 즉 예측 범위가 더 정확할수록 큰 보상을 받습니다. 마지막으로, 자신의 글에 투표한 사람이 가장 많을수록 큰 보상을 받습니다. 글에 대한 찬성뿐만 아니라 반대 투표가 많아도 큰 보상을 받을 수 있습니다. 
- 위와 같은 보상체계를 통해 로 Galaxy.fi에는 투자자들이 논쟁을 일으킬만한 유의미한 가격 예측, 투자자들에게 정보를 줄 수 있는 양질의 글이 등장할 수 있습니다. 

## [ Galaxy Token ]
- G토큰은 플랫폼에서 사용되는 토큰으로 이더리움을 스테이킹하여 얻을 수 있습니다. 이더리움 배팅이 아닌 G토큰 배팅을 사용하는 이유는 ……… 
- 특정 유저가 찬성하거나 반대한 글의 적중률을 확인하고, 그가 현재 어떠한 글에 동의를 했는지를 확인하여 투자에 참고할 수 있습니다. 뿐만 아니라 현재 가장 투표 수가 많은 글 등 순위를 공개하여 여론의 가격 예측 방향성을 손쉽게 확인할 수 있습니다.  


## [ SmartContracts ]

### 1. GalaxyController
Galaxy.fi 의 트레이딩 시스템에서는 세 가지 타입의 예측풀(1,3,7일)을 제공하며, 
각 풀의 아티클(Article)에는 롱/숏 포지션이 존재 합니다. 유저는 어떠한 아티클이든 GALA토큰을 이용하여 투표할 수 있습니다. 

아티클 구조체(struct)는 작성자(writer), 투표수(votes), 예측가격(target Price) 등의 변수로 구성되며
예측풀 구조체는 자산유형(assetType, 현시점 BTC 서비스만 제공 예정), 풀이 시작될 때의 가격과 합의 후의 가격, 투표가능여부 등의 변수로 구성됩니다.

본 컨트랙트에서는 이하의 5가지의 이벤트(event)를 상정하고 있습니다.

시스템단( Owner만이 접근)에서 이뤄지는
- InitPool 이벤트는 initPool 함수를 통해 poolIndex_ / assetType_ / price_ 등의 정보가 emit되고, 
- SettlePool 이벤트는 settle 함수를 통해 longIdx_, shortIdx_, finalizePrice_ 등의 정보가 emit됩니다.

유저단에서 이뤄지는
- Votes 이벤트는 vote 함수를 통해 poolIdx_, articleIdx_, amount_ 정보가 기입되는데,  유저가 행하는 투표가 article 투표에 합산되며, 
getVoteCountOf 등의 함수를 통해 총투표수를 확인할 수 있는 기능을 제공 합니다.
- TakeProfit 이벤트는 takeRewardDebt 함수를 통해 reward 관련 정보가 emit 됩니다.

작성자단에서 이뤄지는
- RegisterArticle 이벤트는 registerArticle 함수를 통해 poolIdx_, articleIdx, targetPrice_ 정보가 emit 됩니다.

### 2. GalaxyShare
GALA 토큰(G토큰)을 통해 Pool에 참여하면 해당 갤럭시 풀에 대한  지분으로서 xGALA 토큰을 받게됩니다.
Pool에서 이탈하면 xGALA 토큰은 Burn이 되고 GALA 토큰을 지급받습니다.
참여와 이탈 과정에서의 GALA토큰과 xGALA 토큰의 교환 비율은 xGALA의 발행/소각, 예치된 GALA의 량, 수수료 등에 따라 자동적으로 조정됩니다. 

### 3. GalaxyToken
 Galacy.fi 에서 사용하는 Galacy Token은 ERC20 표준 규격을 따르고 있습니다.

### 4. GalaxyTokenStaking
 Galaxy.fi 내 Token Economy를 위한 장치로서 G토큰을 Staking 해두는 경우 Reward를 받을 수 있습니다.
