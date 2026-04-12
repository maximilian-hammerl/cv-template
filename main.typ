#let data = yaml(sys.inputs.at("translationFile", default: "content/translations/english.yaml"))
#let general = yaml("content/general.yaml")
#let release-version = sys.inputs.at("releaseVersion", default: "dev")

#set page(
  paper: "a4",
  margin: 1.2cm,
  footer: [
    #text(fill: gray)[
      #release-version,
      #datetime.today().display()
    ]
    #if "githubName" in general [
      #h(1fr)
      #text(fill: gray)[
        #link("https://github.com/" + general.githubName + "/cv/releases")[
          #data.downloadCv GitHub
        ]
      ]
    ]
  ]
)

#set par(
  justify: true,
)

#set text(
  font: "Inria Sans",
  lang: "de",
  size: 10pt,
)

#show link: underline

#show "GitHub": name => box[
  #box(image(
    "icons/github.svg",
    height: 0.7em,
  ))
  #name
]

#show "LinkedIn": name => box[
  #box(image(
    "icons/linkedin.svg",
    height: 0.7em,
  ))
  #name
]

#let primaryColor = rgb(50, 110, 180)

#let section-title(title) = [
  #grid(
    columns: (3pt, 1fr),
    gutter: 8pt,
    align: (start, start),
    [
      #rect(width: 3pt, height: 1em, fill: primaryColor)
    ],
    [
      #align(horizon)[
        #text(weight: "bold", size: 12pt)[
          #smallcaps[
            #title
          ]
        ]
      ]
    ],
  )
]

#let section-subtitle(title) = [
  #grid(
    columns: (2pt, 1fr),
    gutter: 4pt,
    align: (start, start),
    [
      #rect(width: 2pt, height: 1em, fill: primaryColor)
    ],
    [
      #align(horizon)[
        *#title*
      ]
    ],
  )
]

#let style-date(value) = text(number-width: "tabular")[#value]

#grid(
  columns: (23%, 75%),
  gutter: 2%,
  [
    #if "profilePictureFileName" in general [
      #rect(
        inset: 0pt,
        stroke: 2pt + primaryColor,
      )[
        #image(
          "content/images/" + general.profilePictureFileName,
          width: 90%,
        )
      ]
    ]

    #v(4pt)

    #if "personalDetails" in data [
      #section-title(data.personalDetails.title)
      #for element in data.personalDetails.data [
        *#element.name* \
        #element.value
        #v(4pt)
      ]

      #v(4pt)
    ]

    #section-title(data.social.title)

    #if "linkedInName" in general [
      *LinkedIn* \
      #link("https://www.linkedin.com/in/" + general.linkedInName)[
        #general.fullName
      ]
      #v(4pt)
    ]

    #if "githubName" in general [
      *GitHub* \
      #link("https://github.com/" + general.githubName)[
        #general.githubName
      ]
      #v(4pt)
    ]

    #v(4pt)

    #section-title(data.contact.title)

    #if "emailAddress" in general [
      *#data.contact.email* \
      #link("mailto:" + general.emailAddress)
      #v(4pt)
    ]

    #if "phoneNumber" in general [
      *#data.contact.phone* \
      #link("tel:" + general.phoneNumber)
      #v(4pt)
    ]

    #v(4pt)

    #section-title(data.language.title)

    #for language in data.language.languages [
      *#language.name* \
      #language.proficiency
      #v(4pt)
    ]

    #text(fill: white)[
      #data.easterEgg
    ]
  ],

  [
    #text(size: 28pt, weight: "bold")[
      #smallcaps(general.fullName)
    ]
    #if "jobTitle" in general [
      #linebreak()
      #text(size: 12pt, fill: primaryColor, weight: "bold")[
        #smallcaps(general.jobTitle)
      ]
    ]

    #if "profile" in data [
      #v(4pt)

      #section-title(data.profile.title)

      #data.profile.text
    ]

    #if "coreSkills" in data [
      #v(4pt)

      #section-title(data.coreSkills.title)

      #for skill in data.coreSkills.skills [
        - #skill
      ]
    ]

    #if "coreTechnologies" in data [
      #v(4pt)

      #section-title(data.coreTechnologies.title)

      #for technology in data.coreTechnologies.technologies [
        - #task
      ]
    ]

    #v(4pt)

    #section-title(data.workExperience.title)

    #for company in data.workExperience.companies [
      #section-subtitle(company.name)

      #grid(
        columns: (25%, 75%),
        gutter: 10pt,
        ..company.positions.map(position => (
          if "to" in position [
            #style-date(position.from) \- #style-date(position.to)
          ] else [
            #style-date(position.from)
          ],
          [ *#position.title* ],
        )).flatten(),
      )

      #if "tasks" in company [
        *#data.tasks:*
        #for task in company.tasks [
          - #task
        ]
      ]

      #if "technologies" in company [
        *#data.technologies:*
        #company.technologies.join(", ")
      ]

      #v(4pt)
    ]

    #section-title(data.education.title)

    #for step in data.education.steps [
      #grid(
        columns: (25%, 75%),
        gutter: 10pt,
        style-date(step.from) + [ \- ] + style-date(step.to),
        [ *#step.title* ]
        + (if "institutionNewline" in step and step.institutionNewline { [ \ ] } else { [ \- ] })
        + step.institution
        + [ \ ]
        + text(size: 8pt)[#step.grading],
      )

      #if "projects" in step [
        *#data.projects*
        #for project in step.projects [
          - #project
        ]
      ]
    ]
  ],
)
