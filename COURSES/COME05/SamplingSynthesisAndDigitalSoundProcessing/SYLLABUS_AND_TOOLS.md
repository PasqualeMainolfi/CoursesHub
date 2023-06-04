# **Sampling Synthesis and Digital Sound Processing (COME/05)**  

[**⬅️ BACK HOME**](/HOME.md)  

Welcome to the "*Sampling, Synthesis, and Digital Sound Processing*" course!  

> **Course Objectives**  

The course objectives aim to provide students with a solid foundation of knowledge in the field of sampling, synthesis, and digital sound processing, as well as the ability to use programming languages to implement audio algorithms and develop practical projects in the field of digital audio. Students will acquire theoretical and practical tools to conduct detailed analysis of audio signals, enabling them to deeply understand the acoustic characteristics of sounds. They will learn to develop scientific communication skills through the study of relevant articles and will be encouraged to write documents to present and share the results of their research.  
Furthermore, the course will offer students an in-depth overview of the potentials and challenges of artificial intelligence (AI) in the field of digital audio. Students will gain knowledge about neural networks and machine learning techniques applied to audio synthesis and manipulation. They will be guided in exploring the multiple applications of AI in sound art and scientific research.  
Through practical projects, students will have the opportunity to experiment with and demonstrate the application of AI techniques in the field of digital audio. They will be encouraged to develop innovative artistic projects that leverage the potentials of AI. At the same time, they will be encouraged to conduct scientific research in the field of digital audio, applying AI techniques for advanced analysis, source separation, or the generation of new algorithms.  
This approach to integrating artificial intelligence in the field of digital audio will provide students with a comprehensive and practical perspective on the challenges and opportunities offered by AI.  

Specifically:

1. *Understand the fundamentals of audio sampling*: 
    - Learn about the sampling theorem and its importance in digital sound processing.
    - Gain familiarity with concepts such as sampling frequency, bit depth, and digital representation of audio signals.

2. *Understand and learn to analyze audio signals*:
    - Learn sound analysis techniques to examine the spectral, temporal, and timbral characteristics of audio signals.
    - Utilize tools and algorithms for spectral analysis.
    - Acquire skills in interpreting and processing the data resulting from analysis.

3. *Familiarize yourself with sound synthesis and processing techniques*:
    - Explore the main methodologies and understand the principles underlying sound synthesis.
    - Gain knowledge of how to apply these techniques for audio signal manipulation.

4. *Use programming languages for audio*:
    - Learn widely used programming languages in the context of digital audio, such as Csound, C++, Python, Java, and others.
    - Acquire skills in writing code to implement sampling, synthesis, and sound processing algorithms.

5. *Develop practical projects*:
    - Apply the acquired knowledge to develop practical projects in the field of sampling, synthesis, and sound processing.
    - Create virtual instruments, audio effects, or interactive applications using audio programming tools.

6. *Creation of artistic material and writing scientific articles*:
    - Utilize the skills acquired in sound synthesis, processing, and analysis to stimulate the creation of original artistic material.
    - Develop scientific communication and research skills in the field of digital audio through writing articles.
    - Explore how technical and artistic skills can integrate in producing meaningful artistic works and presenting scientific research results.

7. *Explore the use of artificial intelligence (AI) for audio synthesis and manipulation*:
    - Understand the basic concepts of artificial intelligence applied to the field of digital audio.
    - Learn to use AI frameworks and libraries such as TensorFlow or PyTorch for audio synthesis and manipulation.
    - Explore the potentials of Evolutionary Algorithms (Genetic Algorithms, Swarm Intelligence, etc.) applied to parameter optimization in synthesis, generation, and manipulation of audio signals.


> **References**

- **Nierhaus G.**, Algorithmic Composition, Paradigms of Automated Music Generation, Springer 2009  
- **Roads C.**, The computer Music Tutorial, MIT 1996  
- **Schlichtharle D.**, Digital Filters, Basic and Design 2nd Edition, Springer 2001  
- **Miranda E. R.**, Computer Sound Design, Synthesis Techniques and Programming, 2002  
- **De Poli G.**, Introduzione alle tecniche di sintesi della musica con elaboratore  
- **Puckette M.**, The Theory and Technique of Electronic Music, 2007  
- **Loy G.**, Musimathics vol. 1 e 2, MIT    
- **Boulanger R.**, The Csound Book, MIT 2000  
- **Huang X., Acero, A. Hon H. W.**, Spoken Language Processing, 2001  
- **Zavalishin V.**, The art of VA filter design, 2018  
- **Downay A. B.**, Think DSP, Digital Signal Processing in Python, GTP 2014  
- **Lazzarini V.**, Yi S., Ffitch J., Heintz J. Brandtsegg O. McCurdy I., Csound, A Sound and Music Computing System, Springer 2016  
- **Zolder U.**, DAFX: Digital Audio Effects 2nd Edition, Wiley 2011  
- **Sweigart A.**, Automate The Boring Stuff with Python 2nd Edition, 2020  
- **Xenakis I.**, Formalized Music, Thought and Matematics in composition, 1992  
- **Rocchesso D.**, Introduction to Sound Processing, 2003  
- **Petrarca S.**, Matematica per la musica e il suono, Aracne 2010 
- **Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C.**, Introduction to algorithms. MIT press. 2022
- **Lazzarini, V., Yi, S., Heintz, J., Brandtsegg, Ø., & McCurdy, I.**, Csound: A sound and music computing system. Springer 2016 


> **Required Software and Tools**

To participate in this course, in addition to a personal computer with sufficient processing power and memory to run programming software, you will need the following tools:  

- Programming Languages
  - [Python](#python)
  - [Java](#java)
  - [CSound](#csound-and-cabbage-studio)
  - [Cabbage Studio](#csound-and-cabbage-studio)

- Virtual Enviroment Manager
  - [Conda](#conda)

- Package Manager (MacOS)
  - [Homebrew](#homebrew-only-for-macos)

- Source Code Editor and IDE
  - [Visual Studio Code](#source-code-editor-and-ide)
  - [PyCharm](#source-code-editor-and-ide)
  - [IntelliJ](#source-code-editor-and-ide)
  - [CSoundQt](#source-code-editor-and-ide)

- Visualization and Analysis of audio signals Software
  - [Sonic Visualizer](#visualization-and-analysis-of-audio-signals-software)


## **Getting Started**  

### **Homebrew (only for MacOS)**  
---
What is Homebrew? Homebrew is a package manager for macOS that allows you to easily install, update, and manage software packages and dependencies. It provides a convenient way to install command-line tools, libraries, and applications on your macOS system. With Homebrew, you can quickly install software packages that are not included in the default macOS installation, keeping your system clean and organized. It also helps manage dependencies between different software packages, ensuring that they work together seamlessly.

...if you have MacOS, first install *Homebrew* (https://brew.sh/index_it)
1. Open the terminal
2. Paste the following command and press <Enter>:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### **Conda**  
---
What is a Virtual Environment Manager? A virtual environment manager, like Conda, helps you create isolated environments with specific software versions and dependencies. This ensures that your course projects and assignments run consistently and independently of your system's global software configurations.

By using Conda, you can create a dedicated environment for the "Course Name" course, install the required packages, and manage their versions separately from other projects or courses you may be working on.

If you're new to Conda, here's a quick guide to get started:

1. Install Conda 
    - by following the official documentation for your operating system: https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html#.
    - or, open the terminal and install conda via brew:  

    ```shell
    brew install --cask miniconda
    ```

2. Create a new Conda environment for the "Course Name" course 

```shell
conda activate
conda create -n [env_name] python=3.10
```

3. Activate the created environment to start working on the course materials: `conda activate course-environment`.
4. Install additional course-specific packages and dependencies.

```shell
conda activate [env_name]

pip install numpy matplotlib pandas pyaudio librosa mido python-rtmidi python-osc
```  

On MacOS you may need to install:  

```shell
brew install ffmpeg
brew install pkg-config
brew install portmidi
brew install portaudio
...
```

### **Python**  
---  
Python is a versatile and popular programming language known for its simplicity and readability. It was created by Guido van Rossum and first released in 1991. Python emphasizes code readability and offers a clean and easy-to-understand syntax, making it an excellent choice for beginners and experienced programmers alike. Python is a high-level language, which means it provides abstractions that simplify the process of developing applications. It has a vast standard library and a thriving ecosystem of third-party packages, making it suitable for a wide range of applications, including web development, data analysis, machine learning, artificial intelligence, scientific computing, and more.  
We will install Python in the virtual environment created via Conda.  

```shell
conda create -n [env_name] python=3.10
```
However, it is also possible to install Python on the main system 
- from the webpage https://www.python.org/
- via `brew` (on MacOS)  
  ```shell
  brew update
  brew install python@3.10
  ```  
  check your installation by running  
  ```shell
  python -version
  ```

### **Java**  
---
Java is a high-level, object-oriented programming language that was developed by Sun Microsystems (now owned by Oracle Corporation) in the mid-1990s. It is widely used for building robust and scalable applications, ranging from desktop and mobile applications to enterprise systems and web applications. One of the key features of Java is its platform independence, which means that Java programs can run on any operating system or device that has a Java Virtual Machine (JVM) installed. This makes Java a popular choice for developing cross-platform applications.  
Java follows the "write once, run anywhere" principle, allowing developers to write code once and deploy it on multiple platforms without the need for major modifications. This is achieved through the use of bytecode, a platform-independent intermediate representation of the Java code, which is executed by the JVM.  
Java provides a rich set of libraries and frameworks, making it easier for developers to build complex applications. It supports multithreading, allowing concurrent execution of multiple tasks, and provides built-in memory management through garbage collection.  

Java installation:  
- you can find all information about at https://www.java.com/en/download/help/download_options.html  
- via `brew` (on MacOS)  
  ```shell
  brew update 
  brew install java
  ```  
  check your installation by running:  
  ```shell
  java -version
  ```

### **CSound and Cabbage Studio**  
---
Csound is a powerful and versatile programming language and software synthesizer designed for sound synthesis and music composition. It provides a flexible and expressive framework for creating and manipulating sound using a text-based programming approach. With Csound, you can design complex audio algorithms, generate various types of sounds, and apply real-time signal processing techniques. It offers a wide range of built-in audio modules and signal processing functions, allowing you to create diverse and unique sonic experiences.  
Csound utilizes a score-driven paradigm, where musical events are specified in a timeline-like format, making it suitable for both algorithmic and interactive music composition. It supports various file formats for audio input and output, enabling integration with other audio software and tools.  
Please visit https://github.com/csound/csound  

1. Install CSound
    - Open the terminal
    - Install CSound:
      - via `brew`
      ```shell
      brew install csound --HEAD
      ```
      - or from https://github.com/csound/csound/releases/tag/6.18.1  
    
    To check if the installation was successful, running:

    ```shell
    csound -v
    ```
    This command will display the version information of Csound installed on your system. If Csound is properly installed and configured, you should see the version number and other relevant details.
    If you encounter any errors or the command is not recognized, it could indicate that Csound is not installed correctly or its executable is not added to the system's PATH. In that case, you may need to troubleshoot the installation or consult the documentation specific to your operating system.

2. Install Cabbage from https://cabbageaudio.com/download/  


### **Source Code Editor and IDE**  
---


1. Visual Studio Code, commonly referred to as VS Code, is a lightweight yet powerful source code editor developed by Microsoft. It is designed to provide a modern and customizable environment for coding, debugging, and collaboration.  
   Install VS Code from https://code.visualstudio.com/  
   or, on MacOS, via `brew` by running the following command:  
   ```shell
   brew update
   brew install --cask visual-studio-code
   ```  
   To adapt VS Code to our work, open the editor and install the following exentions:  
   - Csound  
   - Language Support for Java 
   - Python  
   - Pylance
   - Markdown All in One
   - Intellicode  

2. Install PyCharm and IntelliJ from https://www.jetbrains.com/  
   PyCharm is specifically designed for Python development, providing a comprehensive set of tools and features tailored to Python programmers. It offers intelligent code completion, code inspections, and quick fixes to help you write clean and efficient Python code. PyCharm also includes advanced debugging capabilities, integrated version control, and support for popular Python frameworks and libraries.
   IntelliJ IDEA, on the other hand, is a general-purpose IDE that supports multiple programming languages, including Java, Kotlin, JavaScript, and more. It provides a wide range of features for efficient coding, such as smart code completion, refactoring tools, and powerful debugging capabilities. IntelliJ IDEA is known for its excellent support for Java development, including frameworks like Spring, and it offers a rich ecosystem of plugins and extensions.

3. Install CSoundQt from https://github.com/CsoundQt/CsoundQt/releases/tag/v1.1.1  
   CsoundQt is an integrated development environment (IDE) for Csound, a powerful and versatile programming language for sound synthesis and music composition. CsoundQt provides a graphical user interface (GUI) that simplifies the process of creating and manipulating Csound code.


### **Visualization and Analysis of audio signals Software**  
---  

1. Install Sonic Visualizer from https://www.sonicvisualiser.org/  
   Sonic Visualiser is an open-source application designed for the visualization, analysis, and annotation of audio files. It provides a user-friendly interface for exploring the content and structure of sound recordings.
   With Sonic Visualiser, you can load audio files in various formats and examine their waveform, spectrogram, and other visual representations. These visualizations help you understand the characteristics of the sound, such as pitch, rhythm, and timbre.


**IMPORTANT NOTES**  
If you have downloaded and installed Python from the official website, it is crucial to remember to add Python to the system PATH during the installation process. Adding Python to the system PATH allows the operating system to recognize the "python" command from any location on your computer. This is particularly important when you need to run Python scripts from a terminal window or command prompt. During the Python installation process, you may come across an option to "Add Python to PATH" or a similar choice. Make sure to select this option to enable access to Python from any location.







