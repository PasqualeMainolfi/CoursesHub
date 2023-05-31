## **Required Software and Tools**

To participate in this course, it is necessary to install:

- Programming Languages
  - Python
  - Java
  - CSound
  - Cabbage Studio

- Virtual Enviroment Manager
  - Conda

- Package Manager (MacOS)
  - Homebrew

- Source Code Editor and IDE
  - Visual Studio Code
  - PyCharm
  - IntelliJ
  - CSoundQt

- Software
  - Sonic Visualizer


## **Getting Started**  

**Homebrew (only for MacOS)**  
What is Homebrew? Homebrew is a package manager for macOS that allows you to easily install, update, and manage software packages and dependencies. It provides a convenient way to install command-line tools, libraries, and applications on your macOS system. With Homebrew, you can quickly install software packages that are not included in the default macOS installation, keeping your system clean and organized. It also helps manage dependencies between different software packages, ensuring that they work together seamlessly.

...if you have MacOS, first install *Homebrew* (https://brew.sh/index_it)
1. Open the terminal
2. Paste the following command and press <Enter>:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**Conda**  
What is a Virtual Environment Manager? A virtual environment manager, like Conda, helps you create isolated environments with specific software versions and dependencies. This ensures that your course projects and assignments run consistently and independently of your system's global software configurations.

By using Conda, you can create a dedicated environment for the "Course Name" course, install the required packages, and manage their versions separately from other projects or courses you may be working on.

If you're new to Conda, here's a quick guide to get started:

1. Install Conda 
    - by following the official documentation for your operating system: https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html#.
    - or, open the terminal and install conda via brew:  

    ```
    brew install --cask miniconda
    ```

2. Create a new Conda environment for the "Course Name" course 

```bash
conda activate
conda create -n [env_name] python=3.10
```

3. Activate the created environment to start working on the course materials: `conda activate course-environment`.
4. Install additional course-specific packages and dependencies.

```bash
conda activate [env_name]

pip install numpy matplotlib pandas pyaudio librosa mido python-rtmidi python-osc
```  

On MacOS you may need to install:  

```bash
brew install ffmpeg
brew install pkg-config
brew install portmidi
brew install portaudio
...
```

**CSound and Cabbage Studio**  
Csound is a powerful and versatile programming language and software synthesizer designed for sound synthesis and music composition. It provides a flexible and expressive framework for creating and manipulating sound using a text-based programming approach. With Csound, you can design complex audio algorithms, generate various types of sounds, and apply real-time signal processing techniques. It offers a wide range of built-in audio modules and signal processing functions, allowing you to create diverse and unique sonic experiences.  
Csound utilizes a score-driven paradigm, where musical events are specified in a timeline-like format, making it suitable for both algorithmic and interactive music composition. It supports various file formats for audio input and output, enabling integration with other audio software and tools.  
Please visit https://github.com/csound/csound  

1. Install CSound
    - Open the terminal
    - Install CSound:
      - via brew
      ```
      brew install csound --HEAD
      ```
      - or from https://github.com/csound/csound/releases/tag/6.18.1  
    
    To check if the installation was successful, you can run the following command in your terminal or command prompt:

    ```
    csound -v
    ```
    This command will display the version information of Csound installed on your system. If Csound is properly installed and configured, you should see the version number and other relevant details.
    If you encounter any errors or the command is not recognized, it could indicate that Csound is not installed correctly or its executable is not added to the system's PATH. In that case, you may need to troubleshoot the installation or consult the documentation specific to your operating system.

2. Install Cabbage from https://cabbageaudio.com/download/  


**Source Code Editor and IDE**  

1. Install VSCode from https://code.visualstudio.com/  
   Visual Studio Code, commonly referred to as VS Code, is a lightweight yet powerful source code editor developed by Microsoft. It is designed to provide a modern and customizable environment for coding, debugging, and collaboration.  

2. Install PyCharm and IntelliJ from https://www.jetbrains.com/  
   PyCharm is specifically designed for Python development, providing a comprehensive set of tools and features tailored to Python programmers. It offers intelligent code completion, code inspections, and quick fixes to help you write clean and efficient Python code. PyCharm also includes advanced debugging capabilities, integrated version control, and support for popular Python frameworks and libraries.
   IntelliJ IDEA, on the other hand, is a general-purpose IDE that supports multiple programming languages, including Java, Kotlin, JavaScript, and more. It provides a wide range of features for efficient coding, such as smart code completion, refactoring tools, and powerful debugging capabilities. IntelliJ IDEA is known for its excellent support for Java development, including frameworks like Spring, and it offers a rich ecosystem of plugins and extensions.

3. Install CSoundQt from https://github.com/CsoundQt/CsoundQt/releases/tag/v1.1.1  
   CsoundQt is an integrated development environment (IDE) for Csound, a powerful and versatile programming language for sound synthesis and music composition. CsoundQt provides a graphical user interface (GUI) that simplifies the process of creating and manipulating Csound code.


**Software**  

1. Install Sonic Visualizer from https://www.sonicvisualiser.org/  
   Sonic Visualiser is an open-source application designed for the visualization, analysis, and annotation of audio files. It provides a user-friendly interface for exploring the content and structure of sound recordings.
   With Sonic Visualiser, you can load audio files in various formats and examine their waveform, spectrogram, and other visual representations. These visualizations help you understand the characteristics of the sound, such as pitch, rhythm, and timbre.


**IMPORTANT NOTES**  
If you have downloaded and installed Python from the official website, it is crucial to remember to add Python to the system PATH during the installation process. Adding Python to the system PATH allows the operating system to recognize the "python" command from any location on your computer. This is particularly important when you need to run Python scripts from a terminal window or command prompt. During the Python installation process, you may come across an option to "Add Python to PATH" or a similar choice. Make sure to select this option to enable access to Python from any location.



