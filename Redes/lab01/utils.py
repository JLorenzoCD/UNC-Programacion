import re

def find(func, l):
    elem = None

    for  e in l:
        if(func(e)):
            elem = e
            break

    return elem

def quitar_acentos(old : str) -> str:
    new = old.lower()

    new = re.sub(r'[àáâãäå]', 'a', new)
    new = re.sub(r'[èéêë]', 'e', new)
    new = re.sub(r'[ìíîï]', 'i', new)
    new = re.sub(r'[òóôõö]', 'o', new)
    new = re.sub(r'[ùúûü]', 'u', new)

    return new