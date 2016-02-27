# DB DSEIGN
## Models
### Userモデル
#### Asosiations
    has_many [reviews, questions, lectures, chats]
    has_many :contracts, foreign_key: :hostuser_id
    has_many :contracts, foreign_key: :guestuser_id

#### Column
- id
- name
- email
- thumnail
- introduce


### Reviewモデル
#### Asosiations
    belongs_to [user, contract]

#### Column
- id
- user_id
- contract_id
- rank
- reason


### Questionモデル
#### Asosiations
    belongs_to :user
    has_one :contract, as: contractable

#### Column
- id
- user_id
- title
- content
- timelimit
- reward

### Lectureモデル
#### Asosiations
    belongs_to :user
    has_one :contract, as: :contractable

#### Column
- id
- user_id
- title
- content
- avarable_time
- charge

### Contractモデル
#### Asosiations
    has_one :review
    belongs_to :contractable, polymorphic: true
    belongs_to [user]

#### Column
- id
- contractable_id
- contractable_type
- hostuser_id
- guestuser_id


### Chatモデル
#### Asosiations
    belongs_to [user, contract]

#### Column
- id
- user_id
- contract_id
- text



## Setting
* ruby_vertion 2.3.0