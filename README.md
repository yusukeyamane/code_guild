# Code_guild
# DB DSEIGN

## Models
### Userモデル
  - name
  - email
  - thumnail
  - git_url
  - programming_languages_of_interest
  - programming_Eexperience
  - company
  - credits

### Mentorモデル
  - name
  - email
  - solution_count
  - introduce

### Questionモデル
  - title
  - description
  - user_id

### Chatモデル
  - content
  - user_id
  - mentor_id
  - question_id

## Asosiations
#####User
  has_many [questions, chats]
#####Mentor
  has_many [questions, chats]
#####Question
  belongs_to [users, mentors]
  has_one [chat]
#####Chat
  has_many [users, mentors]
  has_one [chat]

## Setting
* ruby_vertion 2.1.8
