# **Sampling, Synthesis and Digital Sound Processing 1st Year (Bachelor)**  

[**⬅️ BACK HOME**](/README.md)

|                          |     |
|:-------------------------|:----|
|**Duration of the course**|30h  |
|**Study hours**           |150h |
|**CFA**                   |5    |
|**Prerequisites**         |🇮🇹 È richiesta una conoscenza di base del linguaggio di programmazione Python, che comprenda: sintassi di base, tipi di dati, strutture di controllo, funzioni e conoscenza delle principali librerie di base (math, random, etc…). È inoltre necessaria una conoscenza di base di CSound, un linguaggio di programmazione per la sintesi sonora, che comprenda almeno la comprensione della struttura di un file .csd, la sintassi di base, i tipi di dati ed essere in grado di generare un evento sonoro semplice usando opcode come oscillatori o generatori di rumore. In quanto al background accademico, invece, è richiesta una buona comprensione dei principi di matematica e fisica affrontati nel corso di studi di un liceo, come algebra, geometria e trigonometria. È necessaria, infine, una conoscenza di base delle nozioni di informatica. Conoscere le componenti fondamentali di un computer, la definizione di algoritmo, che cosa è un programma e cosa è un software, definizione di variabile, e principali strutture dati.<br><br>🇬🇧 A basic knowledge of the Python programming language is required, which includes: basic syntax, data types, control structures, functions, and familiarity with key standard libraries (such as math, random, etc.). Additionally, a basic understanding of CSound, a programming language for sound synthesis, is necessary. This includes at least understanding the structure of a .csd file, basic syntax, data types, and the ability to generate a simple sound event using opcodes like oscillators or noise generators. Regarding academic background, a good understanding of mathematics and physics principles covered in high school is required. This includes algebra, geometry, and trigonometry. Finally, a basic knowledge of computer science concepts is necessary. This includes understanding the fundamental components of a computer, the definition of an algorithm, what a program and software are, the definition of a variable, and familiarity with basic data structures.|
|**Evaluation**                  |🇮🇹 Esame. Valutazione e discussione di un progetto di verifica scelto e realizzato dall'allievo tra una serie di proposte del docente. Le proposte avranno differenti livelli di difficoltà e richiederanno l’applicazione di conoscenze e competenze specifiche acquisite durante il corso. Lo studente dovrà presentare il progetto scelto, fornendo una descrizione dettagliata del suo lavoro, delle metodologie adottate e dei risultati ottenuti. Durante questa fase, la commissione di valutazione avrà l'opportunità di porre domande e richiedere ulteriori chiarimenti sul progetto. La valutazione del progetto sarà condotta in base a criteri predefiniti, quali l'originalità del lavoro, la profondità dell'analisi, la qualità dell'implementazione e la correttezza dei risultati ottenuti. La commissione di valutazione terrà conto anche della capacità dello studente di spiegare e difendere il proprio lavoro in modo chiaro e convincente. Infine, basandosi sulla valutazione del progetto e sulla discussione, la commissione formulerà un giudizio finale sull'esame. Saranno considerati i meriti del lavoro svolto, la capacità di comprendere e applicare i concetti teorici appresi durante il corso, nonché la capacità di presentare e comunicare in modo efficace le proprie idee e ragionamenti. Si sottolinea che l'esame sarà condotto in modo rigoroso, obiettivo e imparziale, al fine di valutare le competenze e le abilità acquisite dallo studente.<br><br>🇬🇧 Exam. Evaluation and discussion of a student-selected and implemented verification project from a series of proposals provided by the instructor. The proposals will have different levels of difficulty and will require the application of specific knowledge and skills acquired during the course. The student will present their chosen project, providing a detailed description of their work, the methods used, and the results obtained. During this phase, the evaluation committee will have the opportunity to ask questions and seek further clarification about the project. The project evaluation will be based on specific criteria, including originality, depth of analysis, implementation quality, and accuracy of results. The committee will also consider the student's ability to explain and defend their work in a clear and persuasive manner. Ultimately, the committee will formulate a final judgment on the exam based on the project evaluation and discussion. The assessment will consider the merits of the work, the student's grasp of the theoretical concepts covered in the course, and their ability to effectively present and communicate ideas and reasoning. It's important to note that the exam will be conducted rigorously, objectively, and impartially, with the sole purpose of evaluating the student's acquired skills and abilities.|
|                          |     |

> **Module 1**

- Physical characteristics of sound phenomena  
- Analog-to-digital (ADC) and digital-to-analog (DAC) conversion  
- Sampling, quantization, and encoding  
- Nyquist-Shannon theorem  
- Sampling Rate and Nyquist frequency  
- Aliasing and anti-aliasing  
- Representation of audio signals as vectors and complex numbers  

> **Module 2**

- Representation of signals in the frequency domain: sampling, truncation, and discretization of frequencies  
- Properties and symmetries of the Fourier Transform (FT)  
- Graphic representation of the frequency domain  
- Discrete Fourier Transform (DFT) and Inverse DFT (IDFT)  
- Short-Time Fourier Transform (STFT) and the influence of the analysis window and uncertainty principle  
- Danielson-Lanczos lemma and Cooley-Tukey algorithm: Fast Fourier Transform   (FFT)

> **Module 3**

- Table-lookup oscillators  
- Fixed waveform synthesis with slowly varying amplitude and frequency  
- Envelope generators and low-frequency control oscillators  
- Utilization of FT for spectral analysis and synthesis  
- Generation of classic waveforms: square, triangle, and sawtooth  
- Additive synthesis and timbre control through component manipulation: algorithms, pros, and cons  
- Main algorithms for additive synthesis
- Fourier series development  

> **Module 4**

- Definition of *filter*  
- Main types of filters: low-pass, high-pass, band-pass, band-stop  
- Butterworth and Chebyshev filters  
- Two-pole and two-zero filters  
- Zero-Delay Feedback Filter  
- Subtractive synthesis  
- Use of filters for spectrum control  

> **Module 5**

- Introduction to sound spatialization  
- Fundamental concepts of sound perception  
- Coordinate system for virtual space control in 2D  
- Two-channel panning algorithms balancing between right and left channels to create spatial perception  
- Linear and Constant Power Panning Function  

> **Lab**

- Use CSound as a programming environment for sound synthesis  
- Integrate Python with CSound for analysis, data processing, user interface management, and event generation automation  
- Practical implementation of analysis, additive synthesis, subtractive synthesis, and two-channel spatialization using Python and/or CSound  

>---
>
>### **Suggested Readings**  
>
>- **Shannon, C. E.**, Communication in the presence of noise. Proceedings of the IRE, 37(1), 10-21, 1949.  
>- **Cooley, J. W., & Tukey, J. W.**, An algorithm for the machine calculation of complex Fourier series. Mathematics of computation, 19(90), 297-301, 1965.  
>- **Savioja, L., Välimäki, V., & Smith III, J. O.**, Real-time additive synthesis with one million sinusoids using a GPU. In Audio Engineering Society Convention 128. Audio Engineering Society 2010.  
>- **Smith III, J. O.**, Spectral audio signal processing 2011.  
>- **Moog, R. A.**, Voltage-controlled electronic music modules, Journal of the Audio Engineering Society 13(3): 200–206, 1965.  
>- **Stilson, T., and J. O. Smith**, Analyzing the Moog VCF with considerations for digital implementation, Proceedings of the International Computer Music Conference, Hong Kong, China, pp. 398–401, 1996.
>
>---
