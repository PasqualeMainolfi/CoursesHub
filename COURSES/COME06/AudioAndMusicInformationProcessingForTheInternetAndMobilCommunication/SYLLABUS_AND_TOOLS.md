# **Audio and Music Information Processing for the Internet and Mobile Communication (COME/06)**  

[**⬅️ BACK HOME**](/HOME.md)  


Welcome to the "*Audio and Music Information Processing for the Internet and Mobile Communication*" course!  

> **Course Objectives**  

The aim of the course is to study technologies for manipulating audio-video information for the web and mobile systems. Students will gain an understanding of fundamental concepts related to multimedia streaming, explore common audio and video formats, study codecs and compression techniques, learn to utilize FFMPEG, a powerful open-source tool for real-time capture and conversion, and develop customized applications for stream management. Moreover, guidelines will be provided for designing and developing simple custom scripts using FFMPEG to automate conversion and media management processes.  
In the practical part of the course, students will have the opportunity to apply their skills by using FFMPEG commands and developing custom applications. They will be encouraged to employ frameworks or libraries to create intuitive user interfaces.  
All of this is aimed at providing students with a solid understanding of principles and practices related to audio-video streaming and how to efficiently and professionally manage multimedia streams using FFMPEG as a key tool.  

Specifically:  

- Acquire an in-depth understanding of the primary audio formats used in mobile communications, such as MP3, AAC, and FLAC.
- Grasp the concepts of lossy and lossless audio compression and the principles of common audio codecs.
- Explore streaming protocols like HTTP Live Streaming (HLS), Real-Time Messaging Protocol (RTMP), and Dynamic Adaptive Streaming over HTTP (DASH).
- Deepen knowledge of Real-time Transport Protocol (RTP) and Real-time Control Protocol (RTCP) for real-time streaming.
- Familiarize oneself with FFMPEG as a powerful tool for recording, converting, and manipulating audio-video streams.
- Learn to design simple scripts for audio-video conversion.
- Explore the utilization of frameworks or libraries for creating user interfaces.
- Design and develop comprehensive applications for audio-video streaming.


> **References**  

- **Kim H. G., Moreau N., Sikora T.**, MPEG-7 Audio and Beyound, Audio content indexing and retrieval, Wiley 2005
- **Watkinson, J.**, The art of digital audio. Taylor & Francis 2001
- **Watkinson, J.**, The art of digital video. Elsevier Inc. 2008
- **Smith, M. D., & Telang, R.**, Streaming, sharing, stealing: Big data and the future of entertainment. Mit Press 2016
- **Korbel, F.**, FFmpeg Basics: Multimedia handling with a fast audio and video encoder. Frantisek Korbel 2012
- **Subhash, V.**, FFmpeg Tips and Tricks. In Quick Start Guide to FFmpeg: Learn to Use the Open Source Multimedia-Processing Tool like a Pro (pp. 165-221). Berkeley, CA: Apress 2023
- **Maia, I.**, Building Web Applications with Flask. Packt Publishing Ltd 2015

> **Educational method**  

The adopted teaching method follows a rigorous structure that includes a theoretical component and a laboratory component. The theoretical part of the lessons is dedicated to a clear and systematic exposition of the fundamental concepts of the subject. Through detailed explanations, relevant examples, and visual illustrations, the aim is to provide students with a deep understanding of the theoretical principles underlying the discipline.  
The laboratory part, on the other hand, constitutes an essential element for consolidating the acquired theoretical knowledge. During these sessions, students have the opportunity to directly apply what they have learned by tackling concrete problems and developing practical skills. Through interactive activities, programming exercises, practical projects, and simulations, students gain familiarity with operational procedures and develop the necessary skills to independently solve problems.  

> **Required Software and Tools**

To participate in this course, in addition to a personal computer with sufficient processing power and memory to run programming software, you will need the following tools:  

- Programming Languages
  - [Python](#python)

- Virtual Enviroment Manager
  - [Conda](#conda)

- Package Manager (MacOS)
  - [Homebrew](#homebrew-only-for-macos)

- Source Code Editor and IDE
  - [Visual Studio Code](#source-code-editor-and-ide)
  - [PyCharm](#source-code-editor-and-ide)

- Software
  - [FFmpeg](#ffmpeg)

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
pip install numpy ffmpeg flask
```  

On MacOS you may need to install:  

```shell
brew install pkg-config
brew install portmidi
brew install portaudio
...
```

### **FFmpeg**  
---
FFmpeg is a comprehensive, open-source software suite that provides a library of multimedia handling functions and a command-line toolset for audio and video processing. It offers a wide range of capabilities for capturing, converting, streaming, and manipulating audio and video streams. With FFmpeg, developers have access to a powerful set of tools and libraries that enable them to perform various multimedia tasks efficiently and effectively.  
The FFmpeg library supports a vast array of audio and video formats, codecs, and protocols, making it a versatile solution for handling media in different applications and platforms. It allows users to decode, encode, transcode, and mux/demux audio and video streams, as well as perform tasks like format conversion, resizing, filtering, and frame extraction.  
FFmpeg's command-line toolset provides a user-friendly interface for executing complex multimedia operations with precise control over various parameters and options. It allows users to perform batch processing, apply filters and effects, adjust audio and video quality, and configure streaming settings.  

You can download and install `ffmpeg` from https://ffmpeg.org/  
or via `brew` (only on MacOS)  
```shell
brew update
brew install ffmpeg
```  

check if the installation was succesful by running in the terminal:  
```shell
ffmpeg
```  
This command will display the version information of `ffmpeg` installed on your system.


### **Python**  
---  
Python is a versatile and popular programming language known for its simplicity and readability. It was created by Guido van Rossum and first released in 1991. Python emphasizes code readability and offers a clean and easy-to-understand syntax, making it an excellent choice for beginners and experienced programmers alike. Python is a high-level language, which means it provides abstractions that simplify the process of developing applications. It has a vast standard library and a thriving ecosystem of third-party packages, making it suitable for a wide range of applications, including web development, data analysis, machine learning, artificial intelligence, scientific computing, and more.  
We will install Python in the virtual environment created via Conda.  

```shell
conda activate
conda create -n [env_name] python=3.10
conda activate [env_name]
pip install numpy ffmpeg flask
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
   - Python  
   - Pylance
   - Markdown All in One
   - Intellicode  

2. Install PyCharm and IntelliJ from https://www.jetbrains.com/  
   PyCharm is specifically designed for Python development, providing a comprehensive set of tools and features tailored to Python programmers. It offers intelligent code completion, code inspections, and quick fixes to help you write clean and efficient Python code. PyCharm also includes advanced debugging capabilities, integrated version control, and support for popular Python frameworks and libraries.
   IntelliJ IDEA, on the other hand, is a general-purpose IDE that supports multiple programming languages, including Java, Kotlin, JavaScript, and more. It provides a wide range of features for efficient coding, such as smart code completion, refactoring tools, and powerful debugging capabilities. IntelliJ IDEA is known for its excellent support for Java development, including frameworks like Spring, and it offers a rich ecosystem of plugins and extensions.






