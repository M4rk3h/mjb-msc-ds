import time

def main():

    """Print the latest tutorial from Real Python"""
    tic = time.perf_counter()
    toc = time.perf_counter()
    print(f"Downloaded the tutorial in {toc - tic:0.4f} seconds")
    print(tutorial)


if __name__ == "__main__":
    main()