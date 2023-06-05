# **Multimedia Systems, Technologies and Programming Languagues (COME/06)** 

[**⬅️ BACK HOME**](/HOME.md)  

Welcome to the "*Multimedia Systems, Technologies and Programming Languagues*" course!  

> **Course Objectives**  

The Multimedia Systems, Technologies and Programming Languagues course is designed to give students a solid foundation of knowledge and skills in the field of multimedia development. Through exploring programming languages like Java, Processing, JavaScript, p5.js, and Python, students will have the chance to learn the practical skills needed to create interactive and innovative multimedia applications.  
Another crucial aspect that will be covered in the course is the application of artificial intelligence techniques in the multimedia context. Students will have the opportunity to dive into machine learning algorithms and computer vision to create intelligent multimedia applications.  
Throughout the course, fundamental concepts such as the MIDI protocol and Open Sound Control (OSC) in the multimedia context will also be explored. These protocols are widely used for communication and control of devices for sound synthesis and other purposes.  
By the end of the course, students will be able to develop sophisticated multimedia applications, integrating different technologies and programming languages. They will also have a solid understanding of design principles and optimization for multimedia system performance, ensuring efficient use of hardware and software resources.  
In conclusion, the Systems, Applications, and Programming Languages for Multimedia course aims to provide students with the skills and knowledge to tackle the challenges of multimedia development, allowing them to experience an exciting and ever-evolving field.

Specifically:

1. Get a complete understanding of multimedia systems, applications, and related programming languages:
   - Study the fundamental concepts of multimedia systems and their components.
   - Explore the applications and industries where multimedia systems are widely used.
   - Dive into different programming languages used in multimedia content development.

2. Learn the basics of programming languages used in multimedia content development, including Java, Processing, JavaScript, p5.js, and Python:
   - Introduction to basic programming concepts and syntax of the selected programming languages.
   - Practice programming exercises to become familiar with coding in these languages.
   - Utilize libraries and available resources to develop interactive multimedia content.

3. Explore the principles and techniques of artificial intelligence (AI) in multimedia applications, using machine learning algorithms and computer vision:
   - Introduction to the basic concepts of artificial intelligence and its applications in the multimedia context.
   - Study machine learning algorithms and computer vision techniques used for processing and analyzing multimedia data.
   - Practical application of AI techniques to enhance interactivity and functionality in multimedia projects.

4. Develop practical skills in using libraries and frameworks like OpenCV and MediaPipe for real-time object recognition and tracking:
   - Explore commonly used libraries and frameworks for real-time multimedia data processing and analysis.
   - Hands-on exercises to implement advanced features in multimedia projects using these tools.

5. Deepen understanding of the MIDI protocol and Open Sound Control (OSC) for communication and control:
   - In-depth study of the MIDI protocol and OSC in the field of production and multimedia.
   - Use libraries and tools to implement communication and control using the MIDI protocol and OSC.
   - Create multimedia projects that leverage the MIDI protocol and OSC to control sounds, lights, or other interactive elements.

6. Create interactive and innovative multimedia projects, integrating different programming languages and AI techniques learned during the course:
   - Develop multimedia projects that combine interactivity, graphics, sound, artificial intelligence, and sensor technologies.
   - Utilize programming languages and techniques learned to create engaging and innovative multimedia experiences.
   - Explore creative approaches and experimentation to create unique multimedia projects.

7. Understand the principles of design and optimization for the performance of multimedia systems, ensuring proper management of hardware and software resources:
   - Study design principles of multimedia systems to ensure optimal user experience.
   - Optimize multimedia projects for maximum efficiency and execution speed.
   - Evaluate hardware and software resources needed to support the multimedia systems developed during the course.


> **References**

- **Vaughan, T.**, Multimedia: Making it work. McGraw-Hill, Inc. 2006
- **Reas, C., & Fry, B.**, Processing: a programming handbook for visual designers and artists. Mit Press 2007
- **Heaton, J.**, Artificial intelligence for humans. Heaton Research, Inc. 2015
- **Cormen, T. H., Leiserson, C. E., Rivest, R. L., & Stein, C.**, Introduction to algorithms. MIT press. 2022
- **Ludovico L. A.**, MIDI, una guida al protocollo, alle estensioni e alla programmazione, Milano University Press 2021
- **Guérin, R.**, MIDI power!: The comprehensive guide. Course Technology PTR 2009
- **Havaldar, P., & Medioni, G.**, Multimedia systems: algorithms, standards, and industry practices. Course Technology 2010
- **Beck, J.**, Designing Sound: Audiovisual Aesthetics in 1970s American Cinema. Rutgers University Press 2016
- **Bohnacker H., Gross B., Laub J.**, Generative Gestaltung: Creative Coding im Web, VHS 2018



> **Required Software and Tools**

To participate in this course, in addition to a personal computer with sufficient processing power and memory to run programming software, you will need the following tools:  

- Programming Languages and Libraries
  - [Python](#python)
  - [Java](#java)
  - [Processing](#processing)
  - [JavaScript](#javascript)
  - [p5.js](#p5js)
  - [CSound](#csound-and-cabbage-studio)

- Virtual Enviroment Manager
  - [Conda](#conda)

- Package Manager (MacOS)
  - [Homebrew](#homebrew-only-for-macos)

- Source Code Editor and IDE
  - [Visual Studio Code](#source-code-editor-and-ide)


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

pip install numpy matplotlib mido python-rtmidi python-osc
pip install opencv-python mediapipe
```  
MediaPipe, OpenCV? 
 
MediaPipe is a cool open-source framework developed by Google for building multimedia applications that work with data streams. It's got a wide range of features for processing images, videos, and audio, so developers can create interactive and smart applications. In this module, we'll dive into the different components of MediaPipe and learn how to use them for processing multimedia data, including the important tracking feature.  

OpenCV, the Open Source Computer Vision Library, is a powerful and widely-used open-source library for computer vision and image processing tasks. With its extensive collection of algorithms and functions, OpenCV empowers developers to harness the power of computer vision technology in their applications. From basic image manipulation to complex object detection and recognition, OpenCV provides the tools and resources needed to unlock the potential of visual data. Whether you're a beginner or an expert, OpenCV is your go-to companion for all things related to computer vision. Get ready to embark on an exciting journey into the world of visual intelligence with OpenCV!

on Apple-Silicon:
```shell
pip install opencv-python mediapipe-silicon
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

### **Processing**  
---
Processing is a versatile programming language and development environment designed for artists, designers, and anyone interested in creating interactive visual and multimedia applications. It provides a simplified syntax and a wide range of built-in functions and libraries, making it accessible for beginners while offering advanced capabilities for more experienced programmers. With Processing, users can easily create dynamic and engaging visual experiences, interactive installations, data visualizations, and much more. Its intuitive interface and extensive community support make it a popular choice for both educational and professional projects in the field of creative coding.  

Install Processing from https://processing.org/download  


### **JavaScript**  
---
To install JavaScript, you don't actually need to install anything specific since JavaScript is a programming language that is natively supported by web browsers.  
It is important to install Node.js. Node.js is an open-source runtime environment based on the Google Chrome V8 JavaScript engine. It is designed to enable the execution of server-side JavaScript, allowing developers to create web applications and backend services using JavaScript on both the client and server sides.

- Install from https://nodejs.org  
- Install via `brew`  
```shell
brew update
brew install node
```

### **p5.js**  
---
From home page (https://p5js.org/): p5.js is a JavaScript library for creative coding, with a focus on making coding accessible and inclusive for artists, designers, educators, beginners, and anyone else! p5.js is free and open-source because we believe software, and the tools to learn it, should be accessible to everyone. Using the metaphor of a sketch, p5.js has a full set of drawing functionality. However, you’re not limited to your drawing canvas. You can think of your whole browser page as your sketch, including HTML5 objects for text, input, video, webcam, and sound.  

please visit: https://p5js.org/download/

### **CSound**  
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
   - JavaScript (ES6) code snippets
   - Processing Language







