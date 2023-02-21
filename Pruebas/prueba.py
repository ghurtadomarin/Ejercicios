import openai

def respond(text):
    completions = openai.Completion.create(
        engine="text-davinci-002",
        prompt=text,
        max_tokens=1024,
        n=1,
        stop=None,
        temperature=0.5,
    )

    message = completions.choices[0].text
    return message

print("Bienvenido a ChatGPT. ¿En qué puedo ayudarte hoy?")
while True:
    user_input = input("You: ")
    response = respond(user_input)
    print("ChatGPT: " + response)
