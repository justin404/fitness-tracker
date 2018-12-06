-- Schema: Questionnaire
-- Prefix: QS_

CREATE TABLE QS_Questionnaire
(
	QuestionnaireID		BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(INCREMENT 1 START 1),
	Name	VARCHAR(250) NOT NULL,
	SentDate		DATE NOT NULL,
	CompletedDate	DATE NOT NULL,
	ExpireDate		DATE NOT NULL,
	ApplicationUserID BIGINT NOT NULL,	
	CreatedDate		TIMESTAMP NOT NULL,
	CreatedUserID	BIGINT NOT NULL,
	ModifiedDate	TIMESTAMP NOT NULL,
	ModifiedUserID	BIGINT NOT NULL,
	ActiveFlag		CHAR(1) NOT NULL,
	CONSTRAINT PK_QS_Questionnaire PRIMARY KEY (QuestionnaireID)
);



CREATE TABLE QS_Question
(
	QuestionID 		BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(INCREMENT 1 START 1),
	QuestionnaireID	BIGINT NOT NULL,
	QuestionValue	VARCHAR(2000) NOT NULL,
	OrderBy			INT NOT NULL,
	RequiredFlag	CHAR(1) NOT NULL,
	CreatedDate		TIMESTAMP NOT NULL,
	CreatedUserID	BIGINT NOT NULL,
	ModifiedDate	TIMESTAMP NOT NULL,
	ModifiedUserID	BIGINT NOT NULL,
	ActiveFlag		CHAR(1) NOT NULL,
	CONSTRAINT PK_QS_Question PRIMARY KEY(QuestionID)
);

CREATE TABLE QS_Answer
(
	AnswerID	BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(INCREMENT 1 START 1),
	QuestionID	BIGINT NOT NULL,
	AnswerTypeCode	BIGINT NOT NULL,
	AnswerValue	VARCHAR(2000),
	MultiChoiceAnswerID	BIGINT,
	CreatedDate		TIMESTAMP NOT NULL,
	CreatedUserID	BIGINT NOT NULL,
	ModifiedDate	TIMESTAMP NOT NULL,
	ModifiedUserID	BIGINT NOT NULL,
	ActiveFlag		CHAR(1) NOT NULL,
	CONSTRAINT PK_QS_Answer PRIMARY KEY (AnswerID)
);

CREATE TABLE QS_QuestionnaireTemplate
(
	QuestionnaireTemplateID BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(INCREMENT 1 START 1),
	TemplateName VARCHAR(250) NOT NULL,
	QuestionnaireName VARCHAR(250),
	CreatedDate		TIMESTAMP NOT NULL,
	CreatedUserID	BIGINT NOT NULL,
	ModifiedDate	TIMESTAMP NOT NULL,
	ModifiedUserID	BIGINT NOT NULL,
	ActiveFlag		CHAR(1) NOT NULL,
	CONSTRAINT PK_QS_QuestionnaireTemplate PRIMARY KEY (QuestionnaireTemplateID)
);

CREATE TABLE QS_QuestionnaireTemplateMap
(
	QuestionnaireTemplateMapID	BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(INCREMENT 1 START 1),
	QuestionnaireTemplateID	BIGINT NOT NULL,
	QuestionID		BIGINT NOT NULL,
	OrderBy			INT NOT NULL,
	CreatedDate		TIMESTAMP NOT NULL,
	CreatedUserID	BIGINT NOT NULL,
	ModifiedDate	TIMESTAMP NOT NULL,
	ModifiedUserID	BIGINT NOT NULL,
	ActiveFlag		CHAR(1) NOT NULL,
	CONSTRAINT PK_QS_QuestionTemplateMapID PRIMARY KEY (QuestionnaireTemplateMapID)
);

CREATE TABLE QS_QuestionTemplate
(
	QuestionTemplateID 		BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(INCREMENT 1 START 1),
	QuestionValue	VARCHAR(2000) NOT NULL,
	RequiredFlag	CHAR(1) NOT NULL,
	QuestionTypeCode BIGINT NOT NULL,
	CreatedDate		TIMESTAMP NOT NULL,
	CreatedUserID	BIGINT NOT NULL,
	ModifiedDate	TIMESTAMP NOT NULL,
	ModifiedUserID	BIGINT NOT NULL,
	ActiveFlag		CHAR(1) NOT NULL,
	CONSTRAINT PK_QS_QuestionTemplateID PRIMARY KEY(QuestionTemplateID)
);

-- This needs work - it might not be multi choice. 
-- What about - select all that apply, rank these
CREATE TABLE QS_MultiChoiceAnswer
(
	MultiChoiceAnswerID		BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(INCREMENT 1 START 1),
	AnswerStringValue		VARCHAR(2000),
	AnswerNumericValue		BIGINT,
	AnswerBooleanValue		CHAR(1),
	CreatedDate		TIMESTAMP NOT NULL,
	CreatedUserID	BIGINT NOT NULL,
	ModifiedDate	TIMESTAMP NOT NULL,
	ModifiedUserID	BIGINT NOT NULL,
	ActiveFlag		CHAR(1) NOT NULL,
	CONSTRAINT PK_QS_MultiChoiceAnswer PRIMARY KEY(MultiChoiceAnswerID)
	
);



