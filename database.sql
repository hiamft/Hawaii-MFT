-- builds original database frame
CREATE TABLE "user"(
	"id" SERIAL PRIMARY KEY,
	"username" VARCHAR(20) NOT NULL UNIQUE,
	"password" VARCHAR(20) NOT NULL
	);
CREATE TABLE "members" (
	"id" INT NOT NULL UNIQUE,
	"zip_code" INT,
	"first_name" VARCHAR(20) NOT NULL,
	"last_name" VARCHAR(20) NOT NULL,
	"prefix" VARCHAR(20),
	"age" INT,
	"license_state" VARCHAR(50),
	"license_expiration" VARCHAR(50),
	"hiamft_member_account_info" VARCHAR(20),
	"supervision_status" VARCHAR(255),
	"fees" VARCHAR(255),
	FOREIGN KEY ("id") REFERENCES "user"("id")
);

CREATE TABLE "insurance_type" (
	"insurance_type_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "insurance_pivot"(
	"insurance_type_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("insurance_type_id") REFERENCES "insurance_type"("insurance_type_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));


CREATE TABLE "license_type" (
	"license_type_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "license_type_pivot"(
	"license_type_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("license_type_id") REFERENCES "license_type"("license_type_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));


CREATE TABLE "languages" (
	"language_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "languages_pivot"(
	"language_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("language_id") REFERENCES "languages"("language_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));


CREATE TABLE "age_groups_served" (
	"age_groups_served_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "age_groups_served_pivot"(
	"age_groups_served_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("age_groups_served_id") REFERENCES "age_groups_served"("age_groups_served_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));
	

CREATE TABLE "treatment_preferences" (
	"treatment_preferences_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "treatment_preferences_pivot"(
	"treatment_preferences_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("treatment_preferences_id") REFERENCES "treatment_preferences"("treatment_preferences_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));
	
	
CREATE TABLE "session_format" (
	"session_format_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "session_format_pivot"(
	"session_format_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("session_format_id") REFERENCES "session_format"("session_format_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));

CREATE TABLE "client_focus" (
	"client_focus_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "client_focus_pivot"(
	"client_focus_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("client_focus_id") REFERENCES "client_focus"("client_focus_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));


CREATE TABLE "phone_type" (
	"phone_type_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "phone_table"(
	"number" INT NOT NULL,
	"member_id" INT NOT NULL,
	"phone_type_id" INT NOT NULL,
	FOREIGN KEY ("phone_type_id") REFERENCES "phone_type"("phone_type_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));
	
	
CREATE TABLE "island" (
	"island_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "island_pivot"(
	"island_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("island_id") REFERENCES "island"("island_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));
	
	
CREATE TABLE "address_type" (
	"address_type_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "address_table"(
	"address_type_id" INT NOT NULL,
	"address" VARCHAR(255) NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("address_type_id") REFERENCES "address_type"("address_type_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));


CREATE TABLE "specialty" (
	"specialty_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "specialty_pivot"(
	"specialty_id" INT NOT NULL,
	"member_id" INT NOT NULL,
	FOREIGN KEY ("specialty_id") REFERENCES "specialty"("specialty_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));


CREATE TABLE "email_type" (
	"email_type_id" SERIAL PRIMARY KEY,
	"title" VARCHAR(255) NOT NULL
);

CREATE TABLE "email_table"(
	"email_type_id" INT NOT NULL,
	"email" VARCHAR(255),
	"member_id" INT NOT NULL,
	FOREIGN KEY ("email_type_id") REFERENCES "email_type"("email_type_id"),
	FOREIGN KEY ("member_id") REFERENCES "members"("id"));
-- Everything below is temporary data for our tables
INSERT INTO "languages" 
    ("title")
VALUES
    ('ASL'),
    ('Arabic'),
    ('Armenian'),
    ('Bosnian'),
    ('Cantonese'),
    ('Croatian'),
    ('Dutch'),
    ('Farsi'),
    ('Filipino'),
    ('French'),
    ('English'),
    ('German'),
    ('Greek'),
    ('Gujarati'),
    ('Hebrew'),
    ('Hindi'),
    ('Hungarian'),
    ('Italian'),
    ('Japanese'),
    ('Korean'),
    ('Mandarin'),
    ('Polish'),
    ('Portuguese'),
    ('Punjabi'),
    ('Romanian'),
    ('Russian'),
    ('Serbian'),
    ('Sinhalese'),
    ('Spanish'),
    ('Swedish'),
    ('Tagalog'),
    ('Turkish'),
    ('Ukrainian'),
    ('Urdu'),
    ('Vietnamese'),
    ('Yiddish');
    
INSERT INTO "insurance_type" 
    ("title")
VALUES
    ('Aetna'),
    ('AlohaCare'),
    ('Beacon'),
    ('Blue Cross'),
    ('Blue Shield'),
    ('BlueCross and BlueShield'),
    ('Cigna'),
    ('Hawaii Medical Assurance Association'),
    ('Hawaii Medical Services Association'),
    ('Humana'),
    ('Kaiser'),
    ('(Out-of-Network)'),
    ('Magellan'),
    ('Medicaid'),
    ('Medicare'),
    ('MHN'),
    ('Military OneSource'),
    ('MultiPlan'),
    ('Ohana Health Plan'),
    ('Optum'),
    ('TRICARE'),
    ('TriWest'),
    ('UnitedHealthcare'),
    ('University Health Alliance'),
    ('WellCare');
INSERT INTO "specialty" 
    ("title")
VALUES
    ('ADHD'),
    ('Addictions'),
    ('Adjustment Disorder'),
    ('Adoption Issues'),
    ('Adult Children of Alcoholics'),
    ('Aging'),
    ('Alcoholism'),
    ('Alzheimer’s Disease'),
    ('Anger Management'),
    ('Anxiety Disorders/Phobias'),
    ('Asperger’s Syndrome'),
    ('Autism'),
    ('Bipolar Disorder'),
    ('Body Dysmorphic Disorder'),
    ('Brain Injury'),
    ('Child Abuse'),
    ('Chronic Physical Illness'),
    ('Co-Dependency'),
    ('Cognitive Disorders'),
    ('Communication Disorders'),
    ('Conduct Disorder'),
    ('Crisis'),
    ('Depression'),
    ('Dissociative Disorders'),
    ('Divorce/Dissolution'),
    ('Domestic Violence'),
    ('Dually Diagnosed Individuals'),
    ('Eating Disorders'),
    ('Ethnic/Cultural Issues'),
    ('Family Conflict'),
    ('Gay/Lesbian Issues'),
    ('Gender Identity'),
    ('Grief/Loss'),
    ('HIV/AIDS Related Issues'),
    ('Hoarding'),
    ('Impaired Professionals'),
    ('Impulse Control Disorders'),
    ('Infertility Issues'),
    ('Infidelity'),
    ('Learning Disabilities'),
    ('Life Transitions'),
    ('Men’s Issues'),
    ('No Speciality (pre-licensed)'),
    ('OCD'),
    ('Oppositional Defiant Disorder'),
    ('PTSD'),
    ('Pain Management'),
    ('Personal Growth'),
    ('Personality Disorders'),
    ('Physical Disabilities'),
    ('Relationship Issues'),
    ('Schizophrenia'),
    ('Self-Esteem'),
    ('Sexual Abuse'),
    ('Sexual Dysfunction'),
    ('Sleep Disorders'),
    ('Smoking Cessation'),
    ('Somatoform Disorders'),
    ('Spirituality'),
    ('Stress Management'),
    ('Substance Abuse'),
    ('Terminal Illness / End-of-Life'),
    ('Tourette’s Disorder'),
    ('Women’s Issues');

INSERT INTO "treatment_preferences" 
    ("title")
VALUES
    ('Adlerian'),
    ('Any'),
    ('Art Therapy'),
    ('Behavioral'),
    ('Biofeedback/Neurofeedback'),
    ('Biopsychosocial'),
    ('Christian'),
    ('Cognitive/Cognitive Behavioral'),
    ('DBT (Dialectical Behavior Therapy)'),
    ('Dance/Movement Therapy'),
    ('Developmental'),
    ('EMDR'),
    ('Eclectic'),
    ('Emotionally Focused'),
    ('Existential/Humanistic'),
    ('Family Systems'),
    ('Feminist'),
    ('Gestalt'),
    ('Hypnotherapy'),
    ('Integrative'),
    ('Interpersonal'),
    ('Multicultural'),
    ('Music Therapy'),
    ('Narrative'),
    ('Neuropsychology'),
    ('Play Therapy'),
    ('Psychoeducational'),
    ('Solution-Focused Brief Therapy'),
    ('Somatic'),
    ('Acceptance and Commitment (ACT)'),
    ('Adlerian'),
    ('AEDP'),
    ('Applied Behavioral Analysis'),
    ('Art Therapy'),
    ('Attachment-based'),
    ('Biofeedback'),
    ('Brainspotting'),
    ('Christian Counseling'),
    ('Clinical Supervision and Licensed Supervisors - Coaching'),
    ('Cognitive Behavioral (CBT)'),
    ('Cognitive Processing (CPT)'),
    ('Compassion Focused'),
    ('Culturally Sensitive'),
    ('Dance/Movement Therapy'),
    ('Dialectical (DBT)'),
    ('Eclectic'),
    ('EMDR'),
    ('Emotionally Focused'),
    ('Existential'),
    ('Experiential Therapy'),
    ('Exposure Response Prevention'),
    ('Expressive Arts'),
    ('Family / Marital'),
    ('Family Systems'),
    ('Feminist'),
    ('Forensic Psychology'),
    ('Gestalt'),
    ('Gottman Method'),
    ('Humanistic'),
    ('Hypnotherapy'),
    ('Imago'),
    ('Integrative'),
    ('Internal Family Systems (IFS)'),
    ('Interpersonal'),
    ('Intervention'),
    ('Jungian'),
    ('Mindfulness-Based (MBCT)'),
    ('Motivational Interviewing'),
    ('Multicultural'),
    ('Music Therapy'),
    ('Narrative'),
    ('Neuro-Linguistic'),
    ('Neurofeedback'),
    ('Parent-Child Interaction (PCIT)'),
    ('Person-Centered'),
    ('Play Therapy'),
    ('Positive Psychology'),
    ('Prolonged Exposure Therapy'),
    ('Psychoanalytic'),
    ('Psychobiological Approach Couple Therapy'),
    ('Psychodynamic'),
    ('Psychological Testing and Evaluation'),
    ('Rational Emotive Behavior (REBT)'),
    ('Reality Therapy'),
    ('Relational'),
    ('Sandplay'),
    ('Schema Therapy'),
    ('Solution Focused Brief (SFBT)'),
    ('Somatic'),
    ('Strength-Based'),
    ('Structural Family Therapy'),
    ('Transpersonal'),
    ('Trauma Focused');

INSERT INTO "age_groups_served" 
    ("title")
VALUES
    ('Any'),
    ('Children'),
    ('Adolescents'),
    ('Adults'),
    ('Elders');
INSERT INTO "client_focus" 
    ("title")
VALUES
    ('Any'),
    ('African American'),
    ('Asian American'),
    ('Buddhist'),
    ('Christian'),
    ('Gay/Lesbian/Bisexual/Transgender'),
    ('Hindu'),
    ('Jewish'),
    ('Latino American'),
    ('Latter-day Saints/Mormon'),
    ('Middle Eastern'),
    ('Military/Veterans'),
    ('Muslim'),
    ('Native American'),
    ('Pacific Islander'),
    ('People with Disabilities'),
    ('Women/Feminist');
INSERT INTO "address_type"
	("title")
VALUES
	('test');
INSERT INTO "email_type"
	("email_type_id", "title")
VALUES
	(1, 'test');
INSERT INTO "island"
	("island_id", "title")
VALUES
	(1,'test');
INSERT INTO "phone_type"
	("phone_type_id", "title")
VALUES
	(1,'test');
INSERT INTO "license_type"
	("license_type_id", "title")
VALUES
	(1,'test');
INSERT INTO "session_format"
	("session_format_id", "title")
VALUES
	(1,'test');

	
	
	
	
-- insert new user info
INSERT INTO "user"
	("username","password")
VALUES ('test','test');
INSERT INTO "members" 
	("id","zip_code","first_name", "last_name", "prefix", "age","license_state", "license_expiration", "hiamft_member_account_info", "supervision_status","fees")
VALUES(1, NULL, 'test', 'test', NULL, NULL, NULL, NULL, NULL,NULL,NULL);
INSERT INTO "session_format_pivot"
	("session_format_id", "member_id")
VALUES 
	(1,1);
INSERT INTO "specialty_pivot"
	("specialty_id", "member_id")
VALUES
	(1,1);
INSERT INTO "treatment_preferences_pivot"
	("treatment_preferences_id","member_id")
VALUES
	(1,1);
INSERT INTO "address_table"
	("address", "address_type_id", "member_id")
VALUES
	('test',1, 1);
INSERT INTO "email_table" 
	("email_type_id", "member_id", "email")
VALUES
	(1,1,'test');
INSERT INTO "island_pivot"
	("island_id", "member_id")
VALUES
	(1,1);
INSERT INTO "languages_pivot"
	("language_id", "member_id")
VALUES 
	(1,1);
INSERT INTO "license_type_pivot"
	("license_type_id", "member_id")
VALUES 
	(1,1);
INSERT INTO "phone_table"
	("phone_type_id", "member_id","number")
VALUES 
	(1,1,1);
INSERT INTO "age_groups_served_pivot"
	("age_groups_served_id", "member_id")
VALUES 
	(1,1);
INSERT INTO "client_focus_pivot"
	("client_focus_id", "member_id")
VALUES 
	(1,1);
INSERT INTO "insurance_pivot"
	("insurance_type_id", "member_id")
VALUES
	(1,1);


-- sql queries for our gets
SELECT * FROM members;

SELECT address_table.member_id, address_type.title AS address_type FROM address_type
JOIN address_table ON address_type.address_type_id=address_table.address_type_id;

SELECT age_groups_served_pivot.member_id, age_groups_served.title AS age_groups_served FROM age_groups_served
JOIN age_groups_served_pivot ON age_groups_served.age_groups_served_id=age_groups_served_pivot.age_groups_served_id;

SELECT client_focus_pivot.member_id, client_focus.title AS client_focus FROM client_focus
JOIN client_focus_pivot ON client_focus.client_focus_id=client_focus_pivot.client_focus_id;

SELECT email_table.member_id,email_table.email, email_type.title AS email_type FROM email_type
JOIN email_table ON email_table.email_type_id=email_type.email_type_id;

SELECT insurance_pivot.member_id, insurance_type.title AS insurance_type FROM insurance_type
JOIN insurance_pivot ON insurance_pivot.insurance_type_id=insurance_type.insurance_type_id;

SELECT island_pivot.member_id, island.title AS island FROM island
JOIN island_pivot ON island_pivot.island_id = island.island_id;

SELECT member_id, title AS languages FROM languages_pivot
JOIN languages ON languages.language_id = languages_pivot.language_id;

SELECT member_id, number, title AS number_type FROM phone_table
JOIN phone_type ON phone_table.phone_type_id = phone_type.phone_type_id;

SELECT member_id, title AS session_format FROM session_format_pivot
JOIN session_format ON session_format_pivot.session_format_id = session_format.session_format_id;

SELECT member_id, title AS specialty FROM specialty_pivot
JOIN specialty ON specialty.specialty_id = specialty_pivot.specialty_id;

SELECT member_id, title AS treatment_preferences FROM treatment_preferences_pivot
JOIN treatment_preferences ON treatment_preferences_pivot.treatment_preferences_id = treatment_preferences.treatment_preferences_id;
