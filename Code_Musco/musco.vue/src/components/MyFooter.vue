<template>
    <footer>
        <ul>
            <li>FAQ</li>
            <li>Mentions légales</li>
            <li>Contact</li>
        </ul>
    </footer>
</template>

<script>
export default {
    name: "MyFooter"
}
</script>

<style scoped lang="scss">
    footer {
        font-family: 'Shrikhand', cursive;
        color: white;
        background: black;
        width: 100%;
        height: 60px;
        text-align: center;

        ul {
            list-style: none;

            li {
                width: 150px;
                text-align: center;
                // display: flex;
                display: inline-block;
                // flex-wrap: wrap;
                line-height: 60px;

                &:hover {
                    cursor: pointer;
                    color: #01dc0e
                }
            }
        }
    }
</style>
