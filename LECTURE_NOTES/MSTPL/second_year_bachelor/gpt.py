# import section
# please install: pip install g4f flask

import g4f

# main scripts


# main function
def main() -> None:
    g4f.debug.logging = True
    g4f.debug.version_check = False
    print(g4f.Provider.Bing.params)
    
    res = g4f.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": "Ciao, parli italiano?"}],
        stream=True
    )
    
    r = []
    for token in res:
        r.append(token)
        print(token, flush=True, end='')
    print()
    
    print(r)
    


# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()