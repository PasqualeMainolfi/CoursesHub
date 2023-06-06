# **Sampling, Synthesis and Digital Sound Processing 1st Year (Bachelor)**  

[**⬅️ BACK HOME**](/HOME.md)  

|                          |     |
|:-------------------------|:----|  
|**Duration of the course**|30h  |
|**Study hours**           |150h |
|**CFA**                   |5    |
|**Prerequisites**         |A basic knowledge of the Python programming language is required, which includes: basic syntax, data types, control structures, functions, and familiarity with key standard libraries (such as math, random, etc.). Additionally, a basic understanding of CSound, a programming language for sound synthesis, is necessary. This includes at least understanding the structure of a .csd file, basic syntax, data types, and the ability to generate a simple sound event using opcodes like oscillators or noise generators. Regarding academic background, a good understanding of mathematics and physics principles covered in high school is required. This includes algebra, geometry, and trigonometry. Finally, a basic knowledge of computer science concepts is necessary. This includes understanding the fundamental components of a computer, the definition of an algorithm, what a program and software are, the definition of a variable, and familiarity with basic data structures.|
|**Evaluation**                  |Eligibility test. Checking out a project chosen by the student from a bunch of projects suggested by the instructor, which come in different levels of difficulty. The project assessment will consider factors such as originality, depth of analysis, quality of implementation, and accuracy of results. Based on this evaluation, a judgment of eligibility or non-eligibility will be determined for the student. The assessment will also take into account the student's ability to understand and apply the theoretical concepts covered in the course. It's important to note that the test will be conducted fairly and objectively, solely aimed at evaluating the student's skills and abilities.|
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
>### **Suggested Readings**  
>
>- **Shannon, C. E.**, Communication in the presence of noise. Proceedings of the IRE, 37(1), 10-21, 1949.  
>- **Cooley, J. W., & Tukey, J. W.**, An algorithm for the machine calculation of complex Fourier series. Mathematics of computation, 19(90), 297-301, 1965.  
>- **Savioja, L., Välimäki, V., & Smith III, J. O.**, Real-time additive synthesis with one million sinusoids using a GPU. In Audio Engineering Society Convention 128. Audio Engineering Society 2010.  
>- **Smith III, J. O.**, Spectral audio signal processing 2011.  
>- **Moog, R. A.**, Voltage-controlled electronic music modules, Journal of the Audio Engineering Society 13(3): 200–206, 1965.  
>- **Stilson, T., and J. O. Smith**, Analyzing the Moog VCF with considerations for digital implementation, Proceedings of the International Computer Music Conference, Hong Kong, China, pp. 398–401, 1996.    
>---




