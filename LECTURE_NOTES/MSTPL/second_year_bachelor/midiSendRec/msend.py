# import section
import mido as pm
import time


# main scripts


# main function
def main() -> None:

    for i, dev in enumerate(pm.get_output_names()):
        print(f"[{i}]:::[{dev}]")
    
    md = int(input("TYPE DEVICE INDEX: "))
    device = pm.get_output_names()[md]
    
    with pm.open_output(device) as devout:
        # message_bytes = pm.Message.from_bytes([0x92, 0x10, 0x20, 0x82, 0x10, 0x20])
        
        # genero i parametri di messaggio
        # .
        # .
        # .
        
        # parsing = pm.parse_all([0x90, 0x10, 0x20, 0x80, 0x10, 0x20])
        message = pm.Message("note_on", note=64)
        devout.send(message)
        
        time.sleep(0.1)
        message = pm.Message("note_off", note=64)
        devout.send(message)

# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()
